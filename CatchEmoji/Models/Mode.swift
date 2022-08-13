//
//  Mode.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import Foundation

enum Mode: String, CaseIterable {
    case result = "Results"
    case play = "Play"
    case info = "Info"
    case intro = "Intro"
}

@propertyWrapper
struct Modes {
    var wrappedValue: [Mode] {
        return Mode.allCases.dropLast()
    }
}
