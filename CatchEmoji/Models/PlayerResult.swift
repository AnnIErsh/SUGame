//
//  PlayerResult.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 13.08.2022.
//

import Foundation
import SwiftUI

struct PlayerResult: Hashable, Codable, Identifiable {
    let id = UUID()
    let date: String
    let score: String
    
    enum CodingKeys: String, CodingKey {
        case date
        case score
    }
}
