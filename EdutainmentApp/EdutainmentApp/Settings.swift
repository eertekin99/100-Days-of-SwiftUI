//
//  Settings.swift
//  EdutainmentApp
//
//  Created by Efe Ertekin on 8.03.2022.
//

import SwiftUI

class Settings: ObservableObject {
    
    @Published var difficultyLevels = ["Easy", "Medium", "Hard"]
    
    //these are needed in GameView
    @Published var multiplicationNumber = 2
    @Published var generatedQuestions = [Int]()
    @Published var answers = [Int]()
    
    
    @Published var questionNumber = 5
    @Published var difficulty = "Medium"
    @FocusState var isFocused: Bool
    
    @Published var isSettingsOn = true
    
    func generateQuestions() {
        generatedQuestions.removeAll()
        answers.removeAll()
        
        if difficulty == "Easy" {
            //easy
            for _ in 0..<questionNumber+5 {
                let letNewNumber = Int.random(in: 2...6)
                generatedQuestions.append(letNewNumber)
                answers.append((letNewNumber * multiplicationNumber))
            }
            
            
        } else if difficulty == "Medium" {
            //medium
            for _ in 0..<questionNumber+5 {
                let letNewNumber = Int.random(in: 3...9)
                generatedQuestions.append(letNewNumber)
                answers.append((letNewNumber * multiplicationNumber))
            }
            
        } else {
            //hard
            for _ in 0..<questionNumber+5 {
                let letNewNumber = Int.random(in: 6...12)
                generatedQuestions.append(letNewNumber)
                answers.append((letNewNumber * multiplicationNumber))
            }
        }
    }
}
