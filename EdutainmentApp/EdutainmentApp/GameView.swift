//
//  GameView.swift
//  EdutainmentApp
//
//  Created by Efe Ertekin on 8.03.2022.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var game: Game = Game()
    @EnvironmentObject var settings: Settings
    @State var isTrue = false
    @State var showResult = false
    @State var isFinished = false
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    Text("\(settings.multiplicationNumber) * \(settings.generatedQuestions[game.roundNumber])")
                } header: {
                    Text("QUESTION \(game.roundNumber+1):")
                }
                
                TextField("", value: $game.answer, format: .number)
                    .keyboardType(.decimalPad)
                
                
            }
            .navigationTitle("Let's Answer!")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        check()
                        showResult.toggle()
                    }
                }
            }
            .alert(isTrue ? "win" : "lose", isPresented: $showResult) {
                Button("Continue", action: nextQuestion)
            } message: {
                let message = isTrue ? "Zuaaa" : "Aglaa"
                Text(message)
            }
            .alert("Game is over", isPresented: $isFinished) {
                Button("Continue", action: backToSettings)
            } message: {
                Text("Your score is: \(game.correctNumber)")
            }
        
        }
        
    }
    
    func check() {
        if settings.answers[game.roundNumber] == game.answer {
            game.correctNumber += 1
            isTrue = true
        } else {
            isTrue = false
        }
    }
    
    func nextQuestion() {
        if settings.questionNumber + 5 > game.roundNumber + 1 {
            game.roundNumber += 1
        } else {
            isFinished = true
        }
    }
    
    func backToSettings() {
        settings.isSettingsOn = true
        settings.questionNumber = 5
        game.correctNumber = 0
        game.roundNumber = 0
    }
    
}
