//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Efe Ertekin on 25.02.2022.
//

import SwiftUI

struct FlagImage: View {
    var countryArrayItem: String
    
    var body: some View {
        Image(countryArrayItem)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 15)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var currentScore = 0
    @State private var wrongAnswer = ""
    @State private var round = 0
    @State private var endTitle = "Game is over"
    @State private var endScore = false
    @State private var correctFlag = false
    @State private var wrongFlag = false
    @State private var selectedNumber = 5
    @State private var makeFlagOpaque = false


    
    var wrongAnswerTaslak: String {
        return "That's the flag of \(wrongAnswer)"
    }
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland",
                     "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 700)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Guess the Flag")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    VStack(spacing: 15){
                        VStack {
                            Text("Tap the flag of")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            Text(countries[correctAnswer])
                                .font(.largeTitle.weight(.semibold))
                        }
                        
                        ForEach(0..<3) { number in
                            Button (action: {
                                
                                withAnimation {
                                    flagTapped(number)
                                }
                                
                                finishGame()
                            }
                            ) {
                                FlagImage(countryArrayItem: countries[number])
//                                Image(countries[number])
//                                    .renderingMode(.original)
//                                    .clipShape(Capsule())
//                                    .shadow(radius: 15)
                            }
                            .rotation3DEffect(.degrees(selectedNumber == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                            .opacity(makeFlagOpaque && !(selectedNumber == number) ? 0.25 : 1)
                            .scaleEffect(makeFlagOpaque && !(selectedNumber == number) ? 0.8 : 1)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    Spacer()
                    
                    Text("Score: \(currentScore)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                
                    Spacer()
                }
                .padding()
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                let message = scoreTitle == "Correct" ? "Your score is \(currentScore)" : wrongAnswerTaslak
                Text(message)
            }
            .alert(endTitle, isPresented: $endScore) {
                Button("Restart", action: reset)
            } message: {
                Text("Your final score -> \(currentScore)")
            }
        
    }
    
    func flagTapped(_ number: Int) {
        selectedNumber = number
        makeFlagOpaque = true
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
            correctFlag = true
            
        } else {
            scoreTitle = "Wrong"
            wrongAnswer = countries[number]
            wrongFlag = true
        }
        
        showingScore = true
        round += 1
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        correctFlag = false
        wrongFlag = false
        selectedNumber = 5
        makeFlagOpaque = false
    }
    
    func reset() {
        currentScore = 0
        round = 0
        askQuestion()
    }
    
    func finishGame() {
        if round == 8 {
            endScore = true
            showingScore = false
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
