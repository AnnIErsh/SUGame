//
//  MenuScreen.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import Foundation
import Navigation
import SwiftUI
import UI

struct MenuScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var route: NavigationViewModel
    @EnvironmentObject var actionViewModel: ActionViewModel
    @Binding var selected: Mode
    @State private var selectedRow: Int?
    @Modes private var modes
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack {
                ForEach(modes.indices, id:\.self) { i in
                    Button("\(modes[i].rawValue)") {
                        selectedRow = i
                        pushScreen(index: i)
                    }
                    .buttonStyle(ButtonStyles())
                    .tag(modes[i])
                    .opacity(
                        selectedRow == i ? 0.1 : 1
                    )
                    .padding()
                }
                Button("Dismiss") {
                    presentationMode.wrappedValue.dismiss()
                    actionViewModel.gameIsActive()
                }
                .modifier(TextStyleSmall())
                .padding()
            }
        }
    }
    
    private func pushScreen(index: Int) {
        route.pop()
        selected = modes[index]
        let new = ScreenMaker(selected: $selected).lazy.toAnyView()
        route.push(screeView: new)
        presentationMode.wrappedValue.dismiss()
    }
}
