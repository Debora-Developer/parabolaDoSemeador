//
//  NanochallengeApp.swift
//  Nanochallenge
//
//  Created by Débora Costa on 30/07/25.
//

//onde começa a rodar o app

import SwiftUI

@main
struct NanochallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.locale, .init(identifier: "pt_BR"))
        }
    }
}
