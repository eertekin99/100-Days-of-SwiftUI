//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Efe Ertekin on 28.02.2022.
//

import SwiftUI

struct Options: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.system(size: 70))
    }
}

struct ScoreAndWin: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.white)
            .cornerRadius(5)
            .padding(20)
    }
}

extension View {
    func optionStyle() -> some View {
        modifier(Options())
    }
    func scoreTitle() -> some View {
        modifier(ScoreAndWin())
    }
}

struct ContentView: View {
    
    let possibleMoves = ["Rock", "Paper", "Scissors"]
    let winnerMoves = ["Paper", "Scissors", "Rock"]
    let emojis = ["🪨","📄","✂️"]
    
    @State private var showingResult = false
    @State private var isGameEnd = false
    @State private var appsCurrentChoice =  0
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var endTitle = "GAME IS OVER!"
    @State private var falseMove = 0
    @State private var round = 0
    
    
    var body: some View {
        
        ZStack{
        
            RadialGradient(stops: [
                .init(color: Color(red: 0.3, green: 0.25, blue: 0.6), location: 0.5),
                .init(color: Color(red: 0.1, green: 0.5, blue: 0.8), location: 0.5)
                ], center: .top, startRadius: 150, endRadius: 500)
                .ignoresSafeArea()
            
            
            VStack{
                
                Spacer()
                Spacer()
                
                VStack {
                    
                    Text("SCORE: \(score)")
                        .scoreTitle()
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Text("\(emojis[appsCurrentChoice])")
                        .font(.system(size: 80))
                        .padding()
                        
                    
                    Text("\(shouldWin == true ? "WIN THE GAME!" : "LOSE THE GAME!")")
                        .scoreTitle()
                        .background(shouldWin ? .green : .red)
                        .cornerRadius(20)
                    
                    
                    Spacer()

                }
                .frame(height: 300)
                .background(.thinMaterial)
                .cornerRadius(25)
                
                Spacer()
                Spacer()
                Spacer()
                
                HStack {
                    
                    Button("🪨") {
                        check("Rock")
                    }
                    .optionStyle()
                    
                    Button("📄") {
                        check("Paper")
                    }
                    .optionStyle()
                    
                    Button("✂️") {
                        check("Scissors")
                    }
                    .optionStyle()
                    
                }
                .background(.thinMaterial)
                .cornerRadius(30)
                
                Spacer()
                
                
            }
        }
        .alert(scoreTitle, isPresented: $showingResult) {
            Button("Continue", action: chooseRandom)
        } message: {
            let message = scoreTitle == "RIGHT!" ? "✅" : "❌"
            Text(message)
        }
        .alert(endTitle, isPresented: $isGameEnd) {
            Button("Restart", action: reset)
        } message: {
            Text("Your final score -> \(score)")
        }
    }
    
    func reset() {
        round = 0
        score = 0
        chooseRandom()
    }
    
    func chooseRandom() {
        
        appsCurrentChoice = Int.random(in: 0...2)
        shouldWin.toggle()
        
    }
    
    func check(_ chosen: String) {
        
        round += 1
        falseMove = winnerMoves.firstIndex(of: possibleMoves[appsCurrentChoice]) ?? 0
        
        if chosen == winnerMoves[appsCurrentChoice] && shouldWin == true {
            scoreTitle = "RIGHT!"
            score += 1
        } else if chosen == possibleMoves[falseMove] && shouldWin == false {
            scoreTitle = "RIGHT!"
            score += 1
        } else {
            scoreTitle = "FALSE!"
            if score > 0 {
                score -= 1
            }
        }
        showingResult = true
        
        if round == 10 {
            isGameEnd = true
        }
        
    }
    
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
