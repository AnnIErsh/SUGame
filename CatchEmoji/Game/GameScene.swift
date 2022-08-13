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
    @Categories var categories
    var allEmojies: [Emoji]?
    
    var emoji: Emoji? {
        return allEmojies?.randomElement()
    }
    
    var category = SKLabelNode()
    var scoreNode = SKLabelNode(text: "score: \(0)")
    
    var groupText: String {
        get {
            return category.text ?? ""
        }
        set {
            category.text = newValue
        }
    }
    
    var count: Int = 0 {
        didSet {
            scoreNode.text = "score: \(count)"
        }
    }
    
    private var area = CGRect()
    private var sound = Sound.url
    let objSize = CGSize(width: 60, height: 60)
    let player: Player = Player(color: .clear, size: CGSize(width: 60, height: 60))
    
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
        addGroup()
        addScore()
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        doActions()
    }
    
    private func addPlayer() {
        player.category = Category(name: groupText, symbol: "🐻")
        player.prepare(area: area.size)
        addChild(player)
    }
    
    private func addGroup() {
        category.position = CGPoint(x: area.size.width * 0.5, y: area.size.height * 0.5)
        category.fontSize = 40
        category.fontColor = .black
        addChild(category)
    }
    
    private func addScore() {
        scoreNode.position = CGPoint(x: area.size.width / 2, y: area.size.height * 0.8)
        scoreNode.fontSize = 40
        scoreNode.fontColor = .black
        addChild(scoreNode)
    }
    
    private func handleGroup() {
        let element = categories.randomElement()
        groupText = element?.name ?? ""
        player.category = Category(name: groupText, symbol: element?.symbol ?? "")
    }
    
    private func emojiSpawn() {
        let emj = EmojiObj(color: .clear, size: objSize)
        let x = random(min: 10, max: area.width)
        let point = CGPoint(x: x, y: area.height)
        emj.position = point
        emj.physicsBody = SKPhysicsBody(rectangleOf: emj.size)
        emj.physicsBody?.mass = .zero
        emj.prepareEmoji(emoji: emoji)
        addChild(emj)
        emj.handleContact()
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(6.0))
        let actionMove = SKAction.move(to: CGPoint(x: x, y: 0), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        emj.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    private func doActions() {
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(emojiSpawn),
                SKAction.wait(forDuration: 1)
            ])
        ))
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(handleGroup),
                SKAction.wait(forDuration: 20)
            ])
        ))
    }
    
    func random() -> CGFloat {
        return CGFloat(CGFloat(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func contactWithObject(object: EmojiObj) {
        //run(SKAction.playSoundFileNamed("audio/sound.mp3", waitForCompletion: false))
        if (object.category?.category == category.text) {
            count += 10
            print("catch: ", object.category?.name as Any)
        }
        else {
            count -= 1
        }
        object.removeFromParent()
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

