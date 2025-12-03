//
//  GameSceneView.swift
//  Nanochallenge
//
//  Created by ChatGPT on 02/08/25.
//

import SpriteKit
import SwiftUI

struct GameSceneView: View {
    @State private var goToNextView = false

    var scene: SKScene {
        let s = GameScene()
        s.size = UIScreen.main.bounds.size
        s.scaleMode = .aspectFit
        return s
    }

    var body: some View {
        NavigationStack {
            ZStack {
                SpriteView(scene: scene)
                    .ignoresSafeArea(edges: .all)
                
                VStack {
                    Text("Eis que o semeador, saiu para semear...")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .onAppear {
                            NotificationCenter.default.addObserver(
                                forName: Notification.Name("goToNextView"),
                                object: nil,
                                queue: .main
                            ) { _ in
                                goToNextView = true
                            }
                        }
                    Spacer()
                }
                .padding(.vertical, 64)
                //Esconde o botão de voltar
                .navigationBarBackButtonHidden()
            }
            .navigationDestination(isPresented: $goToNextView) {
                PathsView()
            }
        }
    }
}

#Preview {
    GameSceneView()
}
