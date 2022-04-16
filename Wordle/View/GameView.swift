//
//  GameView.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/16.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack{
            Image("appBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            KeyboardView()
                .offset(x: 0, y: 240)
            GuessView()
                .frame(width: 350, height: 500)
                .offset(x: 0, y: -80)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
