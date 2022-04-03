//
//  Prospect.swift
//  HotProspects
//
//  Created by Efe Ertekin on 30.03.2022.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
    var addedDate = Date.now
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let fileManager = LocalFileManagerJSON(folderName: "ProspectFolder", appFolder: .documentDirectory)
    let saveKey = "SavedData"
    
    init() {
        
//        if let data = UserDefaults.standard.data(forKey: saveKey) {
//                if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                    people = decoded
//                    return
//                }
//            }
//
//            people = []
        
        if let data = fileManager.getJSON(name: saveKey, dataType: [Prospect()]) {
            people = data
            return
        }
        
        people = []
    }
    
    private func save() {
//        if let encoded = try? JSONEncoder().encode(people) {
//            UserDefaults.standard.set(encoded, forKey: saveKey)
//        }
        
        fileManager.saveJSON(name: saveKey, data: people)
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func sortingName(bool: Bool) {
        switch bool {
            case true:
                people.sort { $0.name < $1.name }
            case false:
                return
        }
    }
    
    func sortingDate(bool: Bool) {
        switch bool {
            case true:
                people.sort { $0.addedDate < $1.addedDate }
            case false:
                return
        }
    }
    
}
