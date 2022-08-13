//
//  PlayerResult.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 13.08.2022.
//

import Foundation
import Foundation
import SwiftUI

struct PlayerResult: Identifiable {
    var id = UUID()
    var name: String
    var date: Date
    var score: Int
}

@propertyWrapper
struct Results {
    var wrappedValue: [PlayerResult]? {
        return [PlayerResult(name: "Me", date: Date.now, score: 1000),
                PlayerResult(name: "Me", date: Date.now, score: 1000),
                PlayerResult(name: "Me", date: Date.now, score: 1000)]
    }
}

//final class Players {
//    static var shared = Players()
//    lazy var players: [Player] = [Player(name: "Player 1", score: 1000),
//                                  Player(name: "Player 2", score: 1000),
//                                  Player(name: "Player 3", score: 1000)]
//}
