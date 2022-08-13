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
        //IColor(Color(hex: 0xd8cee6))
        let color = UIColor.white
        scene.backgroundColor = color
        return scene
    }()
    
    var scene: SKScene {
        gameScene.allEmojies = emojiViewModel.allEmojies
        return gameScene
    }
    
    var body: some View {
        ZStack {
            sprite
        }.background(alignment: .top) {
            Rectangle()
                .fill(Color.clear)
        }
        .ignoresSafeArea()
    }
    
    var sprite: some View {
        SpriteView(scene: scene)
    }
}
