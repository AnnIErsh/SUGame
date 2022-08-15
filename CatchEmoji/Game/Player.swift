//
//  Player.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 10.08.2022.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode {
    
    var category: Category? {
        didSet {
            label.text = category?.symbol
        }
    }
    
    var label = SKLabelNode()
    let basket = SKLabelNode(text: "🗑")
 
    func prepare(area: CGSize) {
        self.position = CGPoint(x: area.width * 0.5 , y: area.height * 0.1)
        let size = CGSize(width: self.size.width, height: self.size.height / 4)
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        basket.fontSize = self.size.height * 1.2
        basket.verticalAlignmentMode = .center
        basket.horizontalAlignmentMode = .center
        self.addChild(basket)
        label.fontSize = self.size.height - 20
        label.verticalAlignmentMode = .center
        label.horizontalAlignmentMode = .center
        label.fontColor = .black
        self.addChild(label)
       
    }
    
    func handleContact() {
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = Contact.projectile
        self.physicsBody?.contactTestBitMask = Contact.object
        self.physicsBody?.collisionBitMask = Contact.none
        self.physicsBody?.usesPreciseCollisionDetection = true
    }
}
