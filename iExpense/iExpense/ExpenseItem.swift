//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Efe Ertekin on 10.03.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type = "Business"
    let amount: Double
}
