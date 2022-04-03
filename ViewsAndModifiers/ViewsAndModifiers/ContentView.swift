//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Efe Ertekin on 26.02.2022.
//

import SwiftUI

struct Title: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(20)
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(25)
    }
}

extension View {
    func titled() -> some View {
        modifier(Title())
    }
}


struct ContentView: View {
    var body: some View {
        VStack{
            Text("Fahrenheit 451")
                .titled()
        }
        .frame(width: .infinity, height: 600, alignment: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
