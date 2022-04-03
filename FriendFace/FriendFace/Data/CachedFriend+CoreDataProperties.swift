//
//  CachedFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Efe Ertekin on 23.03.2022.
//
//

import Foundation
import CoreData


extension CachedFriend {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }
}

extension CachedFriend : Identifiable {
    
}
