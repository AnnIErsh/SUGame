//
//  ResultScreen.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import SwiftUI
import UI

struct ResultScreen: View {
    @EnvironmentObject var playerViewModel: PlayerViewModel
    
    var body: some View {
        ZStack {
            Color.colors[1]
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Results").modifier(ListStyle())
                    .padding()
                List {
                    Section("Date") {
                        ForEach(playerViewModel.results ?? []) { i in
                            HStack {
                                Text("\(i.date)")
                                Spacer()
                                Text("\(i.score)")
                            }
                        }
                    }
                    .modifier(ListStyle())
                }
                .modifier(ListStyle())
                .listStyle(.plain)
                .padding()
                .onAppear {
                    playerViewModel.getScoreFromData()
                }
            }
        }
    }
}

