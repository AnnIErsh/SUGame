//
//  ButtonStyles.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 13.08.2022.
//

import Foundation
import SwiftUI

public struct ButtonStyles: ButtonStyle {
    public init() {}
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.custom(font1.0, size: font1.1))
            .foregroundColor(!configuration.isPressed ? color4 : .green)
    }
}


public struct MenuStyle: ButtonStyle {
    public init() {}
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.custom(font1.0, size: font1.1 * 0.5))
            .foregroundColor(!configuration.isPressed ? color4 : color3)
    }
}
