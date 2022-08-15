//
//  ContentView.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import SwiftUI
import Navigation
import UI

struct ContentView: View {
    @State var selected: Mode = Mode.play
    @State private var isPresented = false
    @ObservedObject var emojiViewModel: EmojiViewModel = .init()
    @ObservedObject var route: NavigationViewModel = .init()
    @ObservedObject var actionViewModel: ActionViewModel = .init()
    
    var body: some View {
        ZStack(alignment: .topTrailing, content: {
            content
        })
        .environmentObject(route)
        .environmentObject(actionViewModel)
    }
    
    @ViewBuilder var content: some View {
        Navigation(transition: Transition.custom(.slide)) {
            ScreenMaker(selected: $selected)
            //.padding()
        }
        .onAppear {
            emojiViewModel.prepareData()
        }
        .environmentObject(emojiViewModel)
        Button("Menu") {
            isPresented.toggle()
            actionViewModel.gameIsPaused()
        }
        .buttonStyle(MenuStyle())
        .dynamicTypeSize(.small)
        .padding(.trailing)
        .showMenu(isPresented: $isPresented,
                  selected: $selected,
                  screen: MenuScreen(selected: $selected).lazy.toAnyView)
    }
}
