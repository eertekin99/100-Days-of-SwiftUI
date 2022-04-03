//
//  Location.swift
//  BucketList
//
//  Created by Efe Ertekin on 26.03.2022.
//

import MapKit
import Foundation

struct Location: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = Location(id: UUID(), name: "Buckingham Palace", description: "Where Queen Elizabeth lives with her dorgis.", latitude: 51.501, longitude: -0.141)
    
    // The last change I’d like to make here is to add a custom == function to the struct. We already made Location conform to Equatable, which means we can already compare one location to another using ==. Behind the scenes, Swift will write this function for us by comparing every property against every other property, which is rather wasteful – all our locations already have a unique identifier, so if two locations have the same identifier then we can be sure they are the same without also checking the other properties.
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }

}
