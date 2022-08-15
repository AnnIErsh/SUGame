//
//  ActionViewModel.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 15.08.2022.
//

import Foundation
import SpriteKit

final class ActionViewModel: ObservableObject {
    var scene: GameScene?
    
    var gameIsPaused: (() -> Void) {
        get {
            return {
                self.scene?.isPaused = true
            }
        }
    }
    
    var gameIsActive: (() -> Void) {
        get {
            return {
                self.scene?.isPaused = false
            }
        }
    }
}
