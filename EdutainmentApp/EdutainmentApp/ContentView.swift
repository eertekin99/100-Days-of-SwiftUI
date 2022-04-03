//
//  ContentView.swift
//  EdutainmentApp
//
//  Created by Efe Ertekin on 7.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject var settings: Settings = Settings()
    
    var body: some View {
        
        VStack{
            //ContentView().environmentObject(settings)
            //Settings section of the app
            settings.isSettingsOn ? AnyView(SettingsView()) : AnyView(GameView())
            
        }
        .environmentObject(settings)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
