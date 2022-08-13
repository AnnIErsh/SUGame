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
    @State var selected: Mode = Mode.intro
    @State private var isPresented = false
    @ObservedObject var emojiViewModel: EmojiViewModel = .init()
    @ObservedObject var route = NavigationViewModel()
    
    var body: some View {
        ZStack(alignment: .topTrailing, content: {
            content
        })
        .environmentObject(NavigationViewModel())
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
        .environmentObject(route)
        
        Button("Menu") {
            isPresented.toggle()
        }
        .buttonStyle(MenuStyle())
        .dynamicTypeSize(.small)
        .padding(.trailing)
        .showMenu(isPresented: $isPresented,
                  selected: $selected,
                  screen: MenuScreen(selected: $selected).lazy.toAnyView)
    }
}
