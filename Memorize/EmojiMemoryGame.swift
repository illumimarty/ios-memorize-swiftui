//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Marty Nodado on 7/14/21.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    // Classes get a free init, and is MUTABLE
    // private(set) would make other classes able to LOOK at this model, but cannot change it
    // all vars HAVE to be equal to something
    // emojis is essentially a global, except that you have to access it through the ViewModel itself
    // static = type variable
    // type inference!!

    static let emojis = ["✌","😂","😝","😁","😱","👉","🙌","🍻","🔥","🌈","☀","🎈","🌹","💄","🎀","⚽","🎾","🏁","😡","👿","🐻","🐶","🐬","🐟"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4 ) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame() // send out that the object will change, automatically does objectWillChange

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards // READ-ONLY
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
