//
//  EmojiObj.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 10.08.2022.
//

import Foundation
import SpriteKit

class EmojiObj: SKSpriteNode {
    
    var category: Emoji?
    
    func prepareEmoji(emoji: Emoji?) {
        var codes: [String] = []
        if let unicodes: [String] = emoji?.unicode {
            for i in unicodes {
                let j = convertEmoji(string: i)
                codes.append(j)
            }
        }
        category = emoji
        let str = codes.joined(separator: "")
        let label = SKLabelNode(text: str)
        label.fontSize = self.size.height - 10
        label.verticalAlignmentMode = .center
        label.horizontalAlignmentMode = .center
        self.addChild(label)
    }
    
    private func convertEmoji(string: String) -> String {
        var str = ""
        if let int = Int(string.replacingOccurrences(of: "U+", with: ""), radix: 16) {
            if let scalar = UnicodeScalar(int) {
                str = String(scalar)
            }
        }
        return str
    }
    
    func handleContact() {
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = Contact.object
        self.physicsBody?.contactTestBitMask = Contact.projectile
        self.physicsBody?.collisionBitMask = Contact.none
    }
}
