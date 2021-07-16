//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Marty Nodado on 6/26/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame() // the game is a pointer to EmojiMemoryGame() class
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
