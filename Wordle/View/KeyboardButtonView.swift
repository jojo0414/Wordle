//
//  KeyboardButtonView.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/16.
//

import SwiftUI

struct KeyboardButtonView: View {
    var index: Int
    @EnvironmentObject var word: wordModel
    
    var body: some View {
        Button {
            word.addChar(character: word.keyboard[index].char)
//            print(word.gussesArray)
        } label: {
            ZStack{
                Rectangle()
                    .frame(width: 35, height: 35)
                    .opacity(0.5)
                    .foregroundColor(word.keyboard[index].color)
                Text(word.keyboard[index].char)
                    .font(.custom("PressStart2P-Regular", size: 30))
                    .foregroundColor(.white)
            }
        }

    }
}

struct KeyboardButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
