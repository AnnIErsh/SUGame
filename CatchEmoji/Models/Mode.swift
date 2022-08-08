//
//  Mode.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import Foundation

enum Mode: String, CaseIterable {
    case result = "Result"
    case play = "Play"
    case score = "Leaderboard"
}

@propertyWrapper
struct Modes {
    var wrappedValue: [Mode] {
        return Mode.allCases
    }
}
