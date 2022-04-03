//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Efe Ertekin on 12.03.2022.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var activities: Activities
    @State var activity: Activity
    
    var body: some View {
        NavigationView {
            Form {
                Text("\(activity.name)")
                Text("\(activity.description)")
                Text("\(activity.numberOfComplete)")
            }
            .toolbar {
                Button {
                    var copy = activity
                    copy.numberOfComplete += 1
                    let index = activities.items.firstIndex(of: activity) ?? 0
                    activities.items[index] = copy
                    activity = copy
                    
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static let activities = Activities()
    static let activity = Activity(name: "Name", description: "Desc")
    
    static var previews: some View {
        ActivityView(activities: activities, activity: activity)
    }
}
