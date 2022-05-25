//
//  GameView.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/16.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var word: wordModel
    @EnvironmentObject var answer: answerModel
    
    var body: some View {
        ZStack{
            Image("appBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            KeyboardView()
                .offset(x: 0, y: 200)
            GuessView()
                .frame(width: 350, height: 400)
                .offset(x: 0, y: -80)
            NavigationLink(isActive: $word.isFinish) {
                ResultView()
            } label: {
                
            }

        }
        .onAppear
        {
            print(word.isFinish)
        }
//        .fullScreenCover(isPresented: $word.isFinish, content: {
//            ResultView()
//        })
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
