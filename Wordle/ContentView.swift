//
//  ContentView.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/16.
//

import SwiftUI

struct ContentView: View {
    @StateObject var word = wordModel()
    
    var body: some View {
        GameView()
            .environmentObject(word)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
