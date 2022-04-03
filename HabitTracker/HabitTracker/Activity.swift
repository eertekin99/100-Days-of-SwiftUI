//
//  Activity.swift
//  HabitTracker
//
//  Created by Efe Ertekin on 12.03.2022.
//

import Foundation

//Activities to track
struct Activity: Identifiable, Codable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var numberOfComplete = 1
}
