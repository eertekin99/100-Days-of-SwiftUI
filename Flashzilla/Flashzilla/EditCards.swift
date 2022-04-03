//
//  EditCards.swift
//  Flashzilla
//
//  Created by Efe Ertekin on 2.04.2022.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    let fileManager = LocalFileManagerJSON(folderName: "Cards_Folder", appFolder: .documentDirectory)
    let saveKey = "SavedData"
    
    var body: some View {
        NavigationView {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                }
                .disableAutocorrection(true)
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            .onAppear(perform: loadData)
        }
    }
    
    func done() {
        dismiss()
    }
    
    func loadData() {
        //        if let data = UserDefaults.standard.data(forKey: "Cards") {
        //            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
        //                cards = decoded
        //            }
        //        }
        if let data =  fileManager.getJSON(name: saveKey, dataType: [Card.example]) {
            cards = data
            return
        }
        
        cards = []
    }
    
    func saveData() {
        //        if let data = try? JSONEncoder().encode(cards) {
        //            UserDefaults.standard.set(data, forKey: "Cards")
        //        }
        
        fileManager.saveJSON(name: saveKey, data: cards)
    }
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
        
        newPrompt = ""
        newAnswer = ""
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}
