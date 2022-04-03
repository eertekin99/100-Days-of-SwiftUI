////
////  Users.swift
////  FriendFace
////
////  Created by Efe Ertekin on 22.03.2022.
////
//
//import Foundation
//import SwiftUI
//
//
//class Users: ObservableObject {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors:[]) var users : FetchedResults<CachedUser>
//    
//    @Published var items = [User]()
//    @Published var cachedItems = [CachedUser]()
//
//    init() {
//        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
//        var request = URLRequest(url: url)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .iso8601
//
//                let decodedUsers = try decoder.decode([User].self, from: data)
//                DispatchQueue.main.async {
//                    self.items = decodedUsers
//                }
//
//                let decodedUsersCD = try decoder.decode([CachedUser].self, from: data)
//                DispatchQueue.main.async {
//                    var newItems = [CachedUser(context: self.moc)]
//                    newItems = decodedUsersCD
//                }
//
//            } catch let error {
//                print("error: \(error)")
//            }
//        }.resume()
//
//    }
//}
