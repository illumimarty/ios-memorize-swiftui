//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Marty Nodado on 7/14/21.
//

import Foundation

// Model
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    // the Model can use private to protect itself from the ViewModel

    func choose(_ card: Card) {
        // reading assignment: "art of naming things"
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        // add numberOfPairsOfCards * 2 cards to cards array
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent // uses a generic type
    }
}
