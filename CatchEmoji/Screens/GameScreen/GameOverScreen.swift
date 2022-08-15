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
    @EnvironmentObject var playerViewModel: PlayerViewModel
    @State var results: [PlayerResult] = []
    var text: PlayerResult {
        let new = playerViewModel.currentResult ?? PlayerResult(date: "", score: "")
        return new
    }

    var body: some View {
        ZStack {
            Color.gradient
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Game Over")
                    .modifier(TextStyle())
                    .padding()
                Text("Your score:\(text.score)")
                    .modifier(TextStyleSmall())
                    .padding()
                Button("Save") {
                    results.append(text)
                    playerViewModel.results? = results
                    playerViewModel.addScoreToData(newData: results)
                }
                .buttonStyle(ButtonStyles())
                .padding()
                .background(.ultraThickMaterial, in: Capsule())
                Button("Dismiss") {
                    route.popToRoot()
                    presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(MenuStyle())
                .padding()
            }
        }
        .onAppear {
            results = playerViewModel.results ?? []
        }
    }
}
