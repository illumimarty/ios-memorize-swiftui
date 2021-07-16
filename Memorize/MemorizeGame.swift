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

    mutating func choose(_ card: Card) { // all arguments in func's are CONSTANTS
        // reading assignment: "art of naming things"
        
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()        
        print("\(cards)")
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // temp!
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        // add numberOfPairsOfCards * 2 cards to cards array
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {  // a var to identify this struct against OTHER structs
        
        // a var to identify this struct against OTHER structs
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent // uses a generic type
        var id: Int

    }
}
