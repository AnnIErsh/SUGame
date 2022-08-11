//
//  Player.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 10.08.2022.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode {
    func prepare(area: CGSize) {
        self.position = CGPoint(x: area.width * 0.5 , y: area.height * 0.1)
        let size = CGSize(width: self.size.width,
                          height: self.size.height / 20)
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
    }
    
    func handleContact() {
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = Contact.projectile
        self.physicsBody?.contactTestBitMask = Contact.object
        self.physicsBody?.collisionBitMask = Contact.none
        self.physicsBody?.usesPreciseCollisionDetection = true
    }
}
