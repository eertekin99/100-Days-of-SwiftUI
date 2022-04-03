//
//  ContentView.swift
//  iExpense
//
//  Created by Efe Ertekin on 9.03.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @StateObject var personalExpenses = PersonalExpenses()
    @State private var showingAddExpense = false
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(personalExpenses.items) { item in
//                        item.type == "Business" ? nil :
                        HStack {
                            VStack {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                                .foregroundColor(item.amount > 10 ? (item.amount < 100 ? Color.yellow : Color.red) : Color.green)
                        }
                    }
                    .onDelete(perform: remove1Items)
                } header: {
                    Text("Personal")
                }
                Section {
                    ForEach(expenses.items) { item in
//                        item.type == "Business" ? nil :
                        HStack {
                            VStack {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                                .foregroundColor(item.amount > 10 ? (item.amount < 100 ? Color.yellow : Color.red) : Color.green)
                        }
                    }
                    .onDelete(perform: removeItems)
                } header: {
                    Text("Business")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses, personalExpenses: personalExpenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func remove1Items(at offsets: IndexSet) {
        personalExpenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
