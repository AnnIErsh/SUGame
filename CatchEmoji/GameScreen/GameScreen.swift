//
//  GameScreen.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import SwiftUI

struct GameScreen: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
                .padding()
            VStack {
                Text("Game")
            }
        }.background(alignment: .top) {
            Rectangle()
                .fill(Color.blue)
        }
        .ignoresSafeArea()
    }
}
