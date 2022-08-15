//
//  GameOverScreen.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 15.08.2022.
//

import Foundation
import SwiftUI
import Navigation
import UI

struct GameOverScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var route: NavigationViewModel
    @State var score: Int = 0
    
    var body: some View {
        ZStack {
            Color.gradient
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Game Over")
                    .modifier(TextStyle())
                    .padding()
                Text("Your score: \(score)")
                    .modifier(TextStyleSmall())
                    .padding()
                Button("Dismiss") {
                    route.popToRoot()
                    presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(MenuStyle())
            }
        }
    }
}
