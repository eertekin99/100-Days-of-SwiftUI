//
//  ContentView.swift
//  HabitTracker
//
//  Created by Efe Ertekin on 12.03.2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var activities = Activities()
    
    @State private var addActivity = false
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(activities.items) { item in
                    NavigationLink("\(item.name)", destination: ActivityView(activities: activities, activity: item))
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit Tracker 🏃‍♂️")
            .toolbar {
                Button {
                    //to open the sheet to add new activity
                    addActivity = true
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
            .sheet(isPresented: $addActivity) {
                AddView(activities: activities)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
