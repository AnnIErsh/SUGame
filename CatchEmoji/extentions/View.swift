//
//  View.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import Foundation
import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
        
    }
    
    var body: Content {
        build()
    }
}

extension View {
    var lazy: some View {
        LazyView(self)
    }
    
    func toAnyView() -> AnyView {
        AnyView(self)
    }

    @ViewBuilder
    func showMenu(isPresented: Binding<Bool>, selected: Binding<Mode>?, screen: @escaping () -> AnyView) -> some View {
        #if os(iOS) || os(tvOS)
        fullScreenCover(isPresented: isPresented, content: screen)
        #elseif os(macOS)
        popover(isPresented: isPresented, content: screen)
        #endif
    }
}
