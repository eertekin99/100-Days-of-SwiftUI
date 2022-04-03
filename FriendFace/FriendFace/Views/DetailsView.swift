//
//  DetailsView.swift
//  FriendFace
//
//  Created by Efe Ertekin on 22.03.2022.
//

import SwiftUI

struct DetailsView: View {
    var user: User
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Text(user.name)
                        Spacer()
                        Text("\(user.age)")
                    }
                } header: {
                    Text("USER")
                }
                
                
                Section {
                    ForEach(user.friends, id: \.id) { friend in
                        HStack{
                            Text(friend.name)
                        }
                    }
                } header: {
                    Text("FRIENDS")
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
