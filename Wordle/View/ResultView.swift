//
//  ResultView.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/30.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var answer: answerModel
    @EnvironmentObject var word: wordModel
    @EnvironmentObject var history: HistoryModel
    @State var isHomePressed = false
    @State var firstAppear: Bool = true
    
    var body: some View {
        ZStack{
            Image("appBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack
            {
                if word.gameState == guessState.allCorrect
                {
                    Text("You Win!")
                        .font(.custom("PressStart2P-Regular", size: 30))
                        .foregroundColor(.white)
                        .padding()
                }
                else
                {
                    Text("You Lose!")
                        .font(.custom("PressStart2P-Regular", size: 30))
                        .foregroundColor(.white)
                        .padding()
                }
                
                VStack(spacing: 1){
                    ForEach(0..<Int(word.tryNum + 1), id: \.self){y in
                        HStack(spacing: 1){
                            ForEach(0..<Int(word.minStringLength), id: \.self){x in
                                Rectangle()
                                    .aspectRatio(1, contentMode: .fit)
                                    .opacity(0.5)
                                    .foregroundColor(word.gussesArray[y * word.minStringLength + x].color)
                            }
                        }
                    }
                }
                .scaledToFit()
                .frame(width: 250)
                .padding()
                
                Text("\(answer.answerWord)")
                    .font(.custom("PressStart2P-Regular", size: 30))
                    .foregroundColor(.white)
                    .padding()
                Text("\(answer.answerWordChinese)")
                    .font(.title)
                    .foregroundColor(.white)
                
                
                Button {
                    print("press home")
                    answer.setLastTime(date: Date())
                    history.historyNum = history.historyArray.count
                    word.isFinish = false
                    print("word isfinish = \(word.isFinish)")
                } label: {
                    ZStack
                    {
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.7)
                        Text("HOME")
                            .font(.custom("PressStart2P-Regular", size: 20))
                            .foregroundColor(.white)
                    }
                    .frame(width: 150, height: 50)
                }
                
                Button {
                    UIPasteboard.general.string = history.historyArray.last?.result
                } label: {
                    ZStack
                    {
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.7)
                        Text("Share")
                            .font(.custom("PressStart2P-Regular", size: 20))
                            .foregroundColor(.white)
                    }
                    .frame(width: 150, height: 50)
                }
            }
            .padding()
        }
        .onAppear
        {
            //                檢查是否呼叫了兩次
            if !self.firstAppear { return }
            self.firstAppear = false
            
            var resultString = ""
            for y in Range(0...Int(word.tryNum))
            {
                for x in Range(0...Int(word.minStringLength) - 1)
                {
                    if word.gussesArray[y * word.minStringLength + x].color == word.colorType[2]
                    {
                        resultString  = resultString + "🟩"
                    }
                    else if word.gussesArray[y * word.minStringLength + x].color == word.colorType[3]
                    {
                        resultString = resultString + "🟨"
                    }
                    else
                    {
                        resultString = resultString + "⬛"
                        
                    }
                }
                resultString = resultString + "\n"
            }
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm E, d MMM y"
            print(formatter.string(from: .now))
            history.historyArray.append(historyData(time: formatter.string(from: .now), answer: answer.answerWord, result: resultString))
        }
    }
}
