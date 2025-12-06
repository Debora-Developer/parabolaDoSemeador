//
//  ContentView.swift
//  Nanochallenge
//
//  Created by Débora Costa on 30/07/25.
//

import SwiftUI
import SpriteKit
import AVFoundation

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?
    
    var scene: SKScene {
        let s = GameScene()
        s.size = UIScreen.main.bounds.size
        s.scaleMode = .aspectFit
        return s
    }
    
    var body: some View {
        // obrigatório estar numa Navigation Stack
        NavigationStack {
            HomeView()
        }
    }
}

#Preview {
    ContentView()
}
