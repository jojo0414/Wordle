//
//  KeyboardButtonView.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/16.
//

import SwiftUI

struct KeyboardButtonView: View {
    var character: String
    @EnvironmentObject var word: wordModel
    
    var body: some View {
        Button {
            word.addChar(character: character)
//            print(word.gussesArray)
        } label: {
            ZStack{
                Rectangle()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.black)
                    .opacity(0.5)
                Text(character)
                    .font(.custom("PressStart2P-Regular", size: 30))
                    .foregroundColor(.white)
            }
        }

    }
}

struct KeyboardButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Image("appBackground")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.8)
            KeyboardButtonView(character: "P")
        }
    }
}
