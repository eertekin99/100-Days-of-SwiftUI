//
//  CachedUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Efe Ertekin on 23.03.2022.
//
//

import Foundation
import CoreData


extension CachedUser {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }
    
    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friend: NSSet?
    
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }
    
    public var wrappedTags: String {
        tags ?? "Unknown Tags"
    }
    
    public var wrappedRegistered: Date {
        registered ?? Date.now
    }
    
    public var wrappedAbout: String {
        about ?? "Unknown About"
    }
    
    public var wrappedAddress: String {
        address ?? "Unknown Address"
    }
    
    public var wrappedEmail: String {
        email ?? "Unknown Email"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown Company"
    }
    
    public var friendArray: [CachedFriend] {
        let set = friend as? Set<CachedFriend> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
}

// MARK: Generated accessors for friend
extension CachedUser {
    
    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: CachedFriend)
    
    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: CachedFriend)
    
    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)
    
    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)
    
}

extension CachedUser : Identifiable {
    
}
