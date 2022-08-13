//
//  Color.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 13.08.2022.
//

import Foundation
import SwiftUI

extension Color {
    public static var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: Color.colors),
                       startPoint: .bottom,
                       endPoint: .top)
    }
    
    public static var text: Self {
        Color(hex: 0x000000)
    }
    
    public static var colors: [Color] {
        [color1, color2, color3]
    }
    
    public init(hex: UInt32) {
        let red = CGFloat((hex >> 16) & 0xFF) / 255.0
        let green = CGFloat((hex >> 8)  & 0xFF) / 255.0
        let blue = CGFloat((hex) & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}
