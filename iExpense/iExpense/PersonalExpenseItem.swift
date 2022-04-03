//
//  PersonalExpenseItem.swift
//  iExpense
//
//  Created by Efe Ertekin on 10.03.2022.
//

import Foundation

struct PersonalExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type = "Personal"
    let amount: Double
}
