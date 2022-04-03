//
//  Game.swift
//  EdutainmentApp
//
//  Created by Efe Ertekin on 8.03.2022.
//

import SwiftUI

class Game: ObservableObject {
    
    @EnvironmentObject var settings: Settings
    @Published var correctNumber = 0
    @Published var roundNumber = 0
    @FocusState var isFocused: Bool
    @Published private var isGameFinished = false
    @Published var answer = 0
    
    
    func nextRound() {
        if roundNumber == settings.questionNumber {
            isGameFinished = true
        }
        roundNumber += 1
    }
}

