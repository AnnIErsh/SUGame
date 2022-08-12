//
//  Emoji.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 09.08.2022.
//

import Foundation
import SwiftUI

struct Emoji: Hashable, Codable {
    let name: String
    let category: String
    let group: String
    let htmlCode: [String]
    let unicode: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case category
        case group
        case htmlCode
        case unicode
    }
}

struct Category {
    let name: String
    let symbol: String
}

struct CategoryData {
    static let categories: [Category] = [
        Category(name: "smileys and people", symbol: "😀"),
        Category(name: "animals and nature", symbol: "🐻"),
        Category(name: "food and drink", symbol: "🍔"),
        Category(name: "travel and places", symbol: "🚘"),
        Category(name: "activities", symbol: "⚽️"),
        Category(name: "objects", symbol: "💡"),
        Category(name: "symbols", symbol: "🔣"),
        Category(name: "flags", symbol: "🏳️"),
    ]
}

@propertyWrapper
struct Categories {
    var wrappedValue: [Category] {
        return CategoryData.categories
    }
}

