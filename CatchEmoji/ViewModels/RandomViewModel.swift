//
//  RandomViewModel.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 10.08.2022.
//

import Foundation

final class RandomViewModel: ObservableObject {
    @Published var emojies: [Emoji] = []
    
    var emoji: Emoji? {
        return emojies.randomElement()
    }
}
