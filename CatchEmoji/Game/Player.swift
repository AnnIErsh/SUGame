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
    
    func prepare(area: CGSize) {
        self.position = CGPoint(x: area.width * 0.5 , y: area.height * 0.1)
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
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
