//
//  GameScene.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import Foundation
import SpriteKit
import SwiftUI

class GameScene: SKScene {
    var allEmojies: [Emoji]?
    
    var emoji: Emoji? {
        return allEmojies?.randomElement()
    }
    
    private var area = CGRect()
    private var sound = Sound.url
    let objSize = CGSize(width: 60, height: 60)
    let player: Player = Player(imageNamed: "box")
    
    override init(size: CGSize) {
        super.init(size: size)
        area = self.frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        self.view?.showsNodeCount = true
        physicsBody = SKPhysicsBody(edgeLoopFrom: area)
        addPlayer()
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(emojiSpawn),
                SKAction.wait(forDuration: 1)
            ])
        ))
    }
    
    private func addPlayer() {
        player.position = CGPoint(x: area.width * 0.5 , y: area.height * 0.1)
        let size = CGSize(width: player.size.width,
                          height: player.size.height / 20)
        player.physicsBody = SKPhysicsBody(rectangleOf: size)
        addChild(player)
    }
    
    private func emojiSpawn() {
        let emj = EmojiObj(color: .black, size: objSize)
        let x = random(min: 10, max: area.width)
        let point = CGPoint(x: x, y: area.height)
        emj.position = point
        emj.physicsBody = SKPhysicsBody(rectangleOf: emj.size)
        emj.prepareEmoji(emoji: emoji)
        addChild(emj)
        emj.handleContact()
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        let actionMove = SKAction.move(to: CGPoint(x: x, y: 0), duration: TimeInterval(actualDuration))
        //let actionMoveDone = SKAction.removeFromParent()
        emj.run(SKAction.sequence([actionMove]))
    }
    
    func random() -> CGFloat {
        return CGFloat(CGFloat(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func contactWithObject(ball: SKSpriteNode) {
        //run(SKAction.playSoundFileNamed("audio/sound.mp3", waitForCompletion: false))
        ball.removeFromParent()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.handleContact()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            player.position.x = t.location(in: self).x
        }
    }
}

//
//if let sound = sound {
//    let backgroundMusic = SKAudioNode(url: sound)
//    backgroundMusic.autoplayLooped = true
//    addChild(backgroundMusic)
//}

