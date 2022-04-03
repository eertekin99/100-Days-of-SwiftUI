//
//  AddView.swift
//  HabitTracker
//
//  Created by Efe Ertekin on 12.03.2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var activities: Activities
    @State private var newActivity = Activity(name: "", description: "")
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name:", text: $newActivity.name)
                    .disableAutocorrection(true)
                    .padding()
                
                TextField("Description", text: $newActivity.description)
                    .disableAutocorrection(true)
                    .padding()
            }
            .navigationTitle("Add New Activity")
            .toolbar {
                Button("Done") {
                    activities.items.append(newActivity)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static let new = Activity(name: "Name", description: "Description")

    static var previews: some View {
        AddView(activities: Activities())
    }
}
