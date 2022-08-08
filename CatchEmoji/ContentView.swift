//
//  ContentView.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import SwiftUI
import Navigation

struct ContentView: View {
    @State var selected: Mode = Mode.play
    @State private var isPresented = false
    
    var body: some View {
        ZStack(alignment: .topTrailing, content: {
            content
        })
        .environmentObject(NavigationViewModel())
    }
    
    @ViewBuilder var content: some View {
        Navigation(transition: Transition.custom(.slide)) {
            ScreenMaker(selected: $selected)
            .padding()
        }
        Button("Open Menu") {
            isPresented.toggle()
        }
        .dynamicTypeSize(.small)
        .padding(.trailing)
        .showMenu(isPresented: $isPresented,
                  selected: $selected,
                  screen: MenuScreen(selected: $selected).lazy.toAnyView)
    }
}