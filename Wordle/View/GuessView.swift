//
//  GuessView.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/16.
//

import SwiftUI

struct GuessView: View {
    @EnvironmentObject var wordModel: wordModel
    @EnvironmentObject var answer: answerModel
    
    var body: some View {
        VStack(spacing: 3) {
            ForEach(0..<Int(wordModel.maxGussesNum), id: \.self){y in
                HStack(spacing: 3){
                    ForEach(0..<Int(wordModel.minStringLength), id: \.self){x in
                        ZStack{
                            Rectangle()
                                .aspectRatio(1, contentMode: .fit)
                                .opacity(0.5)
                                .foregroundColor(wordModel.gussesArray[y * wordModel.minStringLength + x].color)
                            Text(wordModel.gussesArray[y *  wordModel.minStringLength + x].guessString)
                                .font(.custom("PressStart2P-Regular", size: 30))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
