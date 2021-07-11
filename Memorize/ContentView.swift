//
//  ContentView.swift
//  Memorize
//
//  Created by Marty Nodado on 6/26/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✌","😂","😝","😁","😱","👉","🙌","🍻","🔥","🌈","☀","🎈","🌹","💄","🎀","⚽","🎾","🏁","😡","👿","🐻","🐶","🐬","🐟"]
    
    @State var emojiCount = 20
    
    var body: some View {
        // returns something that behaves like a view, inclusive of the inner items

        VStack{
            ScrollView {
                
                // Lazy about accessing the "body" var in the grids
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    
                    // Identifiable: needs an ID like "var"
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
//            VStack {
//                Text("Remove")
//                Text("Card")
//            }
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1

            }
        } label: {
            Image(systemName: "plus.circle")
//            VStack {
//                Text("Add")
//                Text("Card")
//            }
        }
    }
}

struct CardView: View {
    var content: String
    
    // @State is temporary until logic is implemented
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
        //            .padding(.horizontal)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}
