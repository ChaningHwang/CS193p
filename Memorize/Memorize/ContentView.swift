//
//  ContentView.swift
//  Memorize
//
//  Created by Qinyi Huang on 12/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis = ["🚲", "🚂", "✈️", "🚀", "🚗", "🚐", "🏎", "🚕", "🚌", "🛵", "🚝", "🛸", "🚁", "⛵️", "🛳", "🛶"]
    
    var animalTheme = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🦄", "🦉"]
    
    var foodTheme = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈"]
    
    @State var emojiCount = 16
        
    var body: some View {
        VStack {
            HStack{
                Text("Memorize!").font(.largeTitle)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                changeToVehicleTheme
                Spacer()
                changeToAnimalTheme
                Spacer()
                changeToFoodTheme
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var changeToVehicleTheme: some View {
        Button(action: {
            emojis = ["🚲", "🚂", "✈️", "🚀", "🚗", "🚐", "🏎", "🚕", "🚌", "🛵", "🚝", "🛸", "🚁", "⛵️", "🛳", "🛶"]
            emojiCount = 16
        }) {
            VStack{
                Image(systemName: "car")
                Text("vehicles").font(.system(size: 20))
            }
        }
    }
    
    var changeToAnimalTheme: some View {
        Button(action: {
            emojis = animalTheme
            emojiCount = animalTheme.count
        }) {
            VStack{
                Image(systemName: "heart")
                Text("animals").font(.system(size: 20))
            }
        }
    }
    
    var changeToFoodTheme: some View {
        Button(action: {
            emojis = foodTheme
            emojiCount = foodTheme.count
        }) {
            VStack{
                Image(systemName: "person")
                Text("food").font(.system(size: 20))
            }
        }
    }
    
//    var remove: some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//        }
//    }
//
//    var add: some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}
