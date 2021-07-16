//
//  ContentView.swift
//  Memorize
//
//  Created by Marty Nodado on 6/26/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame // view model must always be seen
    
    var body: some View {
        // returns something that behaves like a view, inclusive of the inner items
        
        Text("Memorize!")
            .font(.largeTitle)
        ScrollView {
            // Lazy about accessing the "body" var in the grids
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                // Identifiable: needs an ID like "var"
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card // give it the minimum so the struct can do its job
    
    // don't have to include "init"; tradeoff between adding more code in this view and making the ForEach arg above look better
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
