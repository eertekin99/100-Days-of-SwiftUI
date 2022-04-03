//
//  SettingsView.swift
//  EdutainmentApp
//
//  Created by Efe Ertekin on 8.03.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var settings: Settings
    
    var body: some View {
//        SettingsView().environmentObject(settings)
        
        NavigationView{
            Form {
                
                Section {
                    Stepper("\(settings.multiplicationNumber)", value: $settings.multiplicationNumber, in: 2...12)
                } header: {
                    Text("MULTIPLICATION NUMBER:")
                }
                
                Section {
                    Picker("", selection: $settings.questionNumber) {
                        ForEach(5..<21) {
                            Text("\($0)")
                        }
                    }
                        
                } header: {
                    Text("NUMBER OF QUESTIONS:")
                }
                
                Section {
                    Picker(" ", selection: $settings.difficulty) {
                        ForEach(settings.difficultyLevels, id: \.self) {
                                Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("DIFFICULTY:")
                }
                
                Button("Start the Game") {
                    settings.generateQuestions()
                    settings.isSettingsOn.toggle()
                }
                
//                Text("Question Number: \(settings.questionNumber + 5)")
                
//                Button("Generate Questions") {
//                    stgs.generateQuestions()
//                }
            }
            .navigationTitle("Multiplication Table")
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    settings.isFocused = false
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
