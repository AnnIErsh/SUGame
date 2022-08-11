//
//  GameScreen.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import SwiftUI
import SpriteKit

struct GameScreen: View {
    @EnvironmentObject var emojiViewModel: EmojiViewModel
    
    private var gameScene: GameScene = {
        let scene = GameScene(size: UIScreen.main.bounds.size)
        scene.backgroundColor = UIColor.green
        return scene
    }()
    
    var scene: SKScene {
        gameScene.allEmojies = emojiViewModel.allEmojies
        return gameScene
    }
    
    var body: some View {
        ZStack {
            sprite
            VStack {
                Text("Game")
            }
        }.background(alignment: .top) {
            Rectangle()
                .fill(Color.blue)
        }
        .ignoresSafeArea()
    }
    
    var sprite: some View {
        SpriteView(scene: scene)
    }
}
