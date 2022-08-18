//
//  MemoAmplifierApp.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 8/17/22.
//

import SwiftUI

@main
struct MemoAmplifierApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
        }
        Settings {
            PreferencesMainView()
        }
    }
}
