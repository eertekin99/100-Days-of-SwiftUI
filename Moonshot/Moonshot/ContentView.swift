//
//  ContentView.swift
//  Moonshot
//
//  Created by Efe Ertekin on 10.03.2022.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var toggleList = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                if toggleList == true{
                    LazyVGrid(columns: columns) {
                        ListView()
                    }
                    .padding([.horizontal, .bottom])
                } else {
                    Section {
                        ListView()
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    changeList()
                } label: {
                    Label("Edit", systemImage: "crown.fill")
                }
            }
        }
    }
    
    func changeList() {
        toggleList.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
