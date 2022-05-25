//
//  ContentView.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/16.
//

import SwiftUI

struct ContentView: View {
    @StateObject var answer = answerModel()
    @StateObject var word = wordModel()
    @StateObject var history = HistoryModel()
    
    var body: some View {
            StartView()
            .environmentObject(word)
            .environmentObject(answer)
            .environmentObject(history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
