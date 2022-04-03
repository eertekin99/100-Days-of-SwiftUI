//
//  PersonalExpenses.swift
//  iExpense
//
//  Created by Efe Ertekin on 10.03.2022.
//

import Foundation

class PersonalExpenses: ObservableObject {
    @Published var items = [PersonalExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "PersonalItems")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "PersonalItems") {
            if let decodedItems = try? JSONDecoder().decode([PersonalExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
