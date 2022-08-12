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
        let text = emoji?.unicode.randomElement()
        category = emoji
        if let text = text {
            let char = convertEmoji(string: text)
            let label = SKLabelNode(text: char)
            label.fontSize = self.size.height - 10
            label.verticalAlignmentMode = .center
            label.horizontalAlignmentMode = .center
            self.addChild(label)
        }
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
