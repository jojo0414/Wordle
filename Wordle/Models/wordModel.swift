//
//  wordModel.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/16.
//

import SwiftUI

enum guessState
{
    case allCorrect, partCorrect, notInList, inputNotFinish
}

struct GuessChar{
    var guessString: String
    var color: Color
}

struct KeyboardStruct{
    var char: String
    var color: Color
}

class wordModel: ObservableObject{
    @Published var tryNum: Int = 0
    @Published var maxGussesNum: Int = 6
    @Published var minStringLength: Int = 5
    @Published var gussesArray: [GuessChar]
    @Published var currentInsertIndex: Int = 0
    @Published var keyboard = [KeyboardStruct]()
    @Published var isFinish = false
    @Published var colorType: [Color] = [Color.black, Color.gray, Color.green, Color.yellow]
    
    let keyboardRaw1 = "QWERTYUIOP".map{String($0)}
    let keyboardRaw2 = "ASDFGHJKL".map{String($0)}
    let keyboardRaw3 = "ZXCVBNM".map{String($0)}
    
    var gameState = guessState.partCorrect
    
    init()
    {
        gussesArray = [GuessChar](repeating: GuessChar(guessString: "", color: Color.black), count: 20 * 20)
        
        let keyboardChar = keyboardRaw1 + keyboardRaw2 + keyboardRaw3
        for i in Range(0...25)
        {
            keyboard.append(KeyboardStruct(char: keyboardChar[i], color: colorType[0]))
        }
    }
    
    func restart()
    {
        tryNum = 0
        gussesArray = [GuessChar](repeating: GuessChar(guessString: "", color: colorType[0]), count: 20 * 20)
        currentInsertIndex = 0
        keyboard = [KeyboardStruct]()
        isFinish = false
        
        let keyboardChar = keyboardRaw1 + keyboardRaw2 + keyboardRaw3
        for i in Range(0...25)
        {
            keyboard.append(KeyboardStruct(char: keyboardChar[i], color: colorType[0]))
        }
    }
    
    func setMaxStringLength(maxStringLength: Int)
    {
        self.minStringLength = maxStringLength
    }
    
    func addChar(character: String){
        if currentInsertIndex / minStringLength == tryNum
        {
            gussesArray[currentInsertIndex].guessString = character
            currentInsertIndex += 1
//            print(currentInsertIndex)
        }
    }
    
    func checkInput(questionList: [String]) -> Bool
    {
        var guessString = [String]()
        for i in Range(0...minStringLength - 1)
        {
            if gussesArray[tryNum * minStringLength + i].guessString == ""
            {
//                print("沒有放滿喔")
                self.gameState = guessState.inputNotFinish
                return false
            }
            guessString.append(gussesArray[tryNum * minStringLength + i].guessString)
        }
//        print(guessString.joined())
        for i in Range(0...questionList.count - 1)
        {
            if guessString.joined() == questionList[i]
            {
                return true
            }
        }
        self.gameState = guessState.notInList
        return false
    }
    
    func okButton(answer: String, questionList: [String]){
        //和正確答案做比較，一個一個字比 （正確字和位置 -> green、正確字但是位置錯 -> yellow）
        var answerArray = Array(answer)
        var deleteTimes = 0
        
        if checkInput(questionList: questionList) == false
        {
            return
        }
        
        for i in Range(0...minStringLength - 1)
        {
            if String(answerArray[i - deleteTimes]) == gussesArray[tryNum * minStringLength + i].guessString
            {
                if let index = keyboard.firstIndex(where: {$0.char == gussesArray[tryNum * minStringLength + i].guessString})
                {
                    keyboard[index].color = .green
                }
                else
                {
                    print("error!!!")
                }
                gussesArray[tryNum * minStringLength + i].color = colorType[2]
                answerArray.remove(at: i - deleteTimes)
                deleteTimes += 1
            }
        }
        if answerArray.isEmpty
        {
            self.gameState = guessState.allCorrect
            self.isFinish = true
            return
        }
        
        for i in Range(0...minStringLength - 1)
        {
            if gussesArray[tryNum * minStringLength + i].color == colorType[0]
            {
                var isChanged = false
                for j in Range(0...answerArray.count - 1)
                {
                    if gussesArray[tryNum * minStringLength + i].guessString == String(answerArray[j])
                    {
                        if let index = keyboard.firstIndex(where: {$0.char == gussesArray[tryNum * minStringLength + i].guessString})
                        {
                            if keyboard[index].color == colorType[0]
                            {
                                keyboard[index].color = colorType[3]
                            }
                        }
                        else
                        {
                            print("error!!!")
                        }
                        gussesArray[tryNum * minStringLength + i].color = colorType[3]
                        answerArray.remove(at: j)
                        isChanged = true
                        break
                    }
                }
                if isChanged == false
                {
                    if let index = keyboard.firstIndex(where: {$0.char == gussesArray[tryNum * minStringLength + i].guessString})
                    {
                        if keyboard[index].color == colorType[0]
                        {
                            keyboard[index].color = colorType[1]
                        }
                    }
                    else
                    {
                        print("error!!!")
                    }
                    gussesArray[tryNum * minStringLength + i].color = colorType[1]
                }
            }
        }
        tryNum += 1
        self.gameState = guessState.partCorrect
        return
    }
    
    func deleteButton(){
        if currentInsertIndex > 0 && (currentInsertIndex - 1) / minStringLength == tryNum
        {
            currentInsertIndex -= 1
            gussesArray[currentInsertIndex].guessString = ""
        }
    }
    
}
