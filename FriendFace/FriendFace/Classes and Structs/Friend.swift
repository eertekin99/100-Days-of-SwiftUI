//
//  Friend.swift
//  FriendFace
//
//  Created by Efe Ertekin on 22.03.2022.
//

import Foundation

struct Friend: Codable, Hashable, Identifiable {
    var id: UUID
    var name: String
}
