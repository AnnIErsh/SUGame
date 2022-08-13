//
//  TextStyle.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 13.08.2022.
//

import Foundation
import SwiftUI

public struct TextStyle: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .font(.custom(font3.0, size: font3.1))
            .foregroundColor(color4)
    }
}
