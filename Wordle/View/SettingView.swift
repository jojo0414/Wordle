//
//  SettingView.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/5/11.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var wordModel: wordModel
    @EnvironmentObject var answerModel: answerModel
    @State var maxStringLengthTmp: Double = 0
    @State var maxGuessNum: Double = 0
    
    var body: some View {
        Form{
            Section(header: Text("顏色設定")) {
                ColorPicker("選擇位置正確且字母正確的標示顏色", selection: $wordModel.colorType[2])
                ColorPicker("選擇位置錯誤但字母正確的標示顏色", selection: $wordModel.colorType[3])
                ColorPicker("選擇位置錯誤且字母錯誤的標示顏色", selection: $wordModel.colorType[1])
            }
            Section(header: Text("設定數字")) {
                ZStack(alignment: .leading){
                    if answerModel.isRandomLength
                    {
                        Text("隨機單字長度")
                    }
                    else
                    {
                        Text("設定單字長度：\(answerModel.answerLengrh)")
                    }
                    Toggle("", isOn: $answerModel.isRandomLength)
                }
                if !answerModel.isRandomLength{
                    Slider(value: $maxStringLengthTmp, in:answerModel.getMin()...answerModel.getMax(), step: 1)
                }
                Text("設定猜字次數：\(wordModel.maxGussesNum)")
                Slider(value: $maxGuessNum, in: 1...10, step: 1)
            }
        }
        .onAppear { // ADD THESE AFTER YOUR FORM VIEW
            UITableView.appearance().backgroundColor = .clear
            maxStringLengthTmp = Double(wordModel.minStringLength)
            maxGuessNum = Double(wordModel.maxGussesNum)

        }
        .onDisappear { // CHANGE BACK TO SYSTEM's DEFAULT
            UITableView.appearance().backgroundColor = .systemGroupedBackground
        }
        .onChange(of: maxStringLengthTmp, perform: { newValue in
            wordModel.minStringLength = Int(newValue)
            answerModel.answerLengrh = Int(newValue)
        })
        .onChange(of: maxGuessNum, perform: { newValue in
            wordModel.maxGussesNum = Int(newValue)
        })
        .background(Color(red: 0.067, green: 0.161, blue: 0.310)) // Add your background color
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
