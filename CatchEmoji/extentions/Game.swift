//
//  Game.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 09.08.2022.
//

import Foundation
import SpriteKit

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        // 1
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }

        if ((firstBody.categoryBitMask & Contact.object != 0) &&
            (secondBody.categoryBitMask & Contact.projectile != 0)) {
            if let ball = firstBody.node as? EmojiObj,
               let _ = secondBody.node as? SKSpriteNode {
                contactWithObject(object: ball)
            }
        }
    }
}
