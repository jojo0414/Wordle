//
//  AnswerModel.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/16.
//

import Foundation
import SwiftUI

class answerModel: ObservableObject {
    var questionWord: [String] = [String]()
    var questionWordChinese: [String] = [String]()
    @AppStorage("lastTime") var lastTame = Date().timeIntervalSince1970
    @Published var answerWord: String
    @Published var answerWordChinese: String
    @Published var answerLengrh: Int = 3
    @Published var isRandomLength: Bool = true
    
    init(){
        if let asset = NSDataAsset(name: "computerScienceWord"),
           let content = String(data: asset.data, encoding: .utf8)
        {
            let result = content.split(separator: "\n")
            for i in 0...result.count - 1
            {
                let sperate = result[i].split(separator: " ")
                self.questionWord.append(String(sperate[0]))
                self.questionWordChinese.append(String(sperate[1]))
            }
        }
        
        let randomIndex = Int.random(in: 0..<self.questionWord.count)
        self.answerWord = self.questionWord[randomIndex]
        self.answerWordChinese = self.questionWordChinese[randomIndex]
        print("answer = \(self.answerWord)")
        print("list = \(self.getList())")
    }
    
    func getAnswer()
    {
        let answerList: [String]
        if isRandomLength == true
        {
            answerList = questionWord
        }
        else
        {
            answerList = questionWord.filter{ $0.count == answerLengrh }
        }
        self.answerWord = answerList.randomElement()!
        self.answerWordChinese = questionWordChinese[questionWord.firstIndex(where: {$0 == self.answerWord})!]
    }
    
    func restart()
    {
        getAnswer()
        print("answer = \(self.answerWord)")
        print("list = \(self.getList())")
    }
    
    func getList() -> [String]
    {
        let checkList = questionWord.filter{ $0.count == answerWord.count }
        //        print(checkList)
        return checkList
    }
    
    func getMax() -> Double
    {
        var maxLength: Double = 0
        for i in Range(0...questionWord.count - 1)
        {
            if maxLength < Double(questionWord[i].count)
            {
                maxLength = Double(questionWord[i].count)
            }
        }
        return maxLength
    }
    
    func getMin() -> Double
    {
        var minLength: Double = 20
        for i in Range(0...questionWord.count - 1)
        {
            if minLength > Double(questionWord[i].count)
            {
                minLength = Double(questionWord[i].count)
            }
        }
        return minLength
    }
    
    func setLastTime(date: Date)
    {
        lastTame = date.timeIntervalSince1970
    }
    
    func getLastTime() -> Date
    {
        return Date(timeIntervalSince1970: lastTame)
    }
}
