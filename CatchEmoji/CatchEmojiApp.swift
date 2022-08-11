//
//  CatchEmojiApp.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 08.08.2022.
//

import SwiftUI

@main
struct CatchEmojiApp: App {
    @Configurated var config: ()
    
    init() {
        config
        //Configurator.register()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
