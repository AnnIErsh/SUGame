//
//  TypeViewModel.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import Foundation
import SwiftUI

final class TypeViewModel: ObservableObject {
    @ViewBuilder
    func makeScreen(_ type: Mode) -> some View {
        switch type {
        case .play:
            InstructionScreen()
        case .result:
            ResultScreen()
        case .info:
            InfoScreen()
        }
    }
}
