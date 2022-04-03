//
//  AddView.swift
//  iExpense
//
//  Created by Efe Ertekin on 10.03.2022.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @ObservedObject var personalExpenses: PersonalExpenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                    .disableAutocorrection(true)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Add") {
                    if type == "Personal" {
                        let item = PersonalExpenseItem(name: name, amount: amount)
                        personalExpenses.items.append(item)
                        dismiss()
                    } else {
                        let item = ExpenseItem(name: name, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses(), personalExpenses: PersonalExpenses())
    }
}
