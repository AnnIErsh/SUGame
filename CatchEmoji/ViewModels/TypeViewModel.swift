//
//  TypeViewModel.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import Foundation
import SwiftUI

final class TypeViewModel: ObservableObject {
    @Published var head: Mode = .play
    
    var mode: Mode {
        get { head }
        set { head = newValue }
    }
    
    @ViewBuilder
    func makeScreen(_ type: Mode) -> some View {
        switch type {
        case .intro:
            InstructionScreen()
        case .play:
            GameScreen()
        case .result:
            ResultScreen()
        case .info:
            ScoreScreen()
        }
    }
}
