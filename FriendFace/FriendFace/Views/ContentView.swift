//
//  ContentView.swift
//  FriendFace
//
//  Created by Efe Ertekin on 22.03.2022.
//

import CoreData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var resultsCached: FetchedResults<CachedUser>
    
    @State private var users = [User]()
    //    @ObservedObject var users = Users()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink {
                    DetailsView(user: user)
                } label: {
                    VStack(alignment: .leading) {
                        HStack {
                            Section {
                                Text(user.name)
                                    .font(.headline)
                            }
                            Spacer()
                            Section {
                                Text(user.isActive == true ? "Online" : "Offline")
                                    .font(.caption)
                                    .foregroundColor(user.isActive == true ? Color.green : Color.red)
                            }
                        }
                    }
                }
            }
            .navigationTitle("FriendFace")
            .task {
                if users.count == 0{
                    await loadData()
                }
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else{
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                users = decodedResponse.self
            }
            
            //Save to CoreData if anything changed
            await MainActor.run {
                for user in users {
                    let cachedUser = CachedUser(context: moc)
                    cachedUser.id = user.id
                    cachedUser.name = user.name
                    cachedUser.isActive = user.isActive
                    cachedUser.email = user.email
                    cachedUser.registered = user.registered
                    cachedUser.tags = user.tags.joined(separator: ",")
                    cachedUser.about = user.about
                    cachedUser.company = user.company
                    cachedUser.address = user.address
                    cachedUser.age = Int16(user.age)
                    
                    for friend in user.friends {
                        let cachedFriend = CachedFriend(context: moc)
                        cachedFriend.id = friend.id
                        cachedFriend.name = friend.name
                        cachedUser.addToFriend(cachedFriend)
                    }
                }
                
                if moc.hasChanges {
                    try? self.moc.save()
                }
            }
        } catch {
            //Load from CoreData
            await MainActor.run {
                print("Loaded from CoreData")
                for user in resultsCached {
                    var tempFriends: [Friend] = [Friend]()
                    
                    //TODO user.friendsArray always empty
                    for friend in user.friendArray {
                        let tempFriend = Friend(id: friend.wrappedId, name: friend.wrappedName)
                        tempFriends.append(tempFriend)
                    }
                    
                    let tempUser = User(id: user.wrappedId,
                                        isActive: user.isActive,
                                        name: user.wrappedName,
                                        age: Int(user.age),
                                        company: user.wrappedCompany,
                                        email: user.wrappedEmail,
                                        address: user.wrappedAddress,
                                        about: user.wrappedAbout,
                                        registered: user.wrappedRegistered,
                                        tags: user.wrappedTags.components(separatedBy:","),
                                        friends: tempFriends)
                    users.append(tempUser)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
