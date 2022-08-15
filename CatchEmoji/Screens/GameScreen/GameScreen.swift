//
//  GameScreen.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import SwiftUI
import SpriteKit
import Navigation

struct GameScreen: View {
    @EnvironmentObject var emojiViewModel: EmojiViewModel
    @EnvironmentObject var route: NavigationViewModel
    @EnvironmentObject var actionViewModel: ActionViewModel
    @State var isOver: Bool = false
    @State var isPaused: Bool = false
    
    private var gameScene: GameScene = {
        let scene = GameScene(size: UIScreen.main.bounds.size)
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
                .showMenu(isPresented: $isOver, selected: nil, screen: GameOverScreen().lazy.toAnyView)
        }.background(alignment: .top) {
            Rectangle()
                .fill(Color.clear)
        }
        .ignoresSafeArea()
    }
    
    var sprite: some View {
        SpriteView(scene: scene)
            .onAppear {
                gameScene.change = { i in
                    if i {
                        gameScene.reset = true
                        isOver = true
                    }
                    else {
                        isOver = false
                    }
                }
                actionViewModel.scene = gameScene
            }
    }
}
