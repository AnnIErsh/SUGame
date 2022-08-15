//
//  InfoScreen.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 15.08.2022.
//

import SwiftUI
import UI

struct InfoScreen: View {
    var body: some View {
        ZStack {
            Color.gradient
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Info")
                    .modifier(TextStyle())
                ForEach(Rule.rules.indices, id: \.self) { i in
                    VStack {
                        Text("\(Rule.rules[i])")
                            .modifier(TextRules())
                            .padding()
                    }
                }
            }
        }
    }
}
