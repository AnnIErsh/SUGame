//
//  InstructionScreen.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import SwiftUI
import Navigation
import UI

struct InstructionScreen: View {
    @EnvironmentObject var route: NavigationViewModel
    @EnvironmentObject var actionViewModel: ActionViewModel

    var body: some View {
        ZStack {
            Color.colors[2]
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Catch Emoji ☻Game☻").modifier(TextStyle())
                    .multilineTextAlignment(.center)
                    .padding(2)
                Text("🗑").modifier(TextStyle())
                    .multilineTextAlignment(.center)
                Button("Start") {
                    route.push(screeView: GameScreen().lazy.toAnyView())
                }
                .buttonStyle(ButtonStyles())
                .padding()
                .background(.ultraThickMaterial, in: Capsule())
            }
        }
    }
}
