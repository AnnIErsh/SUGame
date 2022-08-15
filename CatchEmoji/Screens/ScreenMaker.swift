//
//  ScreenMaker.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import Foundation
import SwiftUI

struct ScreenMaker: View {
    @Binding var selected: Mode
    var type = TypeViewModel()

    var screen: AnyView {
        get { type.makeScreen(selected).lazy.toAnyView() }
    }
    
    var body: some View {
        screen
    }
}
