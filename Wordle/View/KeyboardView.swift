//
//  Keyboard.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/16.
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var wordModel: wordModel
    @EnvironmentObject var answerModel: answerModel
    
    @State var isInList = false
    @State var isInputFinish = false
    
    var body: some View {
        VStack(alignment: .center){
            HStack(spacing: 2){
                ForEach(0..<10) { i in
                    KeyboardButtonView(index: i)
                }
            }
            HStack(spacing: 2){
                ForEach(10..<19, content: { i in
                    KeyboardButtonView(index: i)
                })
            }
            HStack(spacing: 2){
                Button {
                    wordModel.okButton(answer: answerModel.answerWord, questionList: answerModel.getList())
                    if wordModel.gameState == guessState.notInList
                    {
                        isInList = true
                    }
                    if wordModel.gameState == guessState.inputNotFinish
                    {
                        isInputFinish = true
                    }
                    
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 65, height: 35)
                            .foregroundColor(.white)
                            .opacity(0.8)
                        Text("OK")
                            .font(.custom("PressStart2P-Regular", size: 30))
                            .foregroundColor(Color("darkBlue"))
                    }
                }
                HStack(spacing: 2){
                    ForEach(19..<26, content: { i in
                        KeyboardButtonView(index: i)
                    })
                }
                Button {
                    wordModel.deleteButton()
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 40, height: 35)
                            .foregroundColor(.white)
                            .opacity(0.8)
                        Text("<")
                            .font(.custom("PressStart2P-Regular", size: 30))
                            .foregroundColor(Color("darkBlue"))
                    }
                }

            }
        }
        .alert("輸入錯誤", isPresented: $isInputFinish) {
            Button {
                
            } label: {
                Text("OK")
            }

        }
        .alert("單字不存在", isPresented: $isInList) {
            Button {
                
            } label: {
                Text("OK")
            }

        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
