//
//  Emoji.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 09.08.2022.
//

import Foundation

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

struct Emojies: Codable {
    var emojies: [Emoji]
    
    enum CodingKeys: String, CodingKey {
        case emojies
    }
}

