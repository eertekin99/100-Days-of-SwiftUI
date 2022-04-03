//
//  NewMateApp.swift
//  NewMate
//
//  Created by Efe Ertekin on 29.03.2022.
//

import SwiftUI

@main
struct NewMateApp: App {
    @StateObject private var localFileManager = LocalFileManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(localFileManager)
        }
    }
}
