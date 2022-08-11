//
//  InstructionScreen.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import SwiftUI
import Navigation

struct InstructionScreen: View {
    @EnvironmentObject var route: NavigationViewModel
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            Button("Start") {
                route.pop()
                route.push(screeView: GameScreen().lazy.toAnyView())
            }
            .foregroundColor(.black)
            .padding()
        }
    }
}
