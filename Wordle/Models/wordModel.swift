//
//  wordModel.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/16.
//

import SwiftUI

class wordModel: ObservableObject{
    @Published var tryNum: Int = 0
    @Published var maxGussesNum: Int = 6
    @Published var maxStringLength: Int = 5
    @Published var gussesArray: [String] = [String](repeating: "", count: 10 * 10)
    @Published var currentInsertIndex: Int = 0
    
    
    func addChar(character: String){
        if currentInsertIndex / maxStringLength == tryNum
        {
            gussesArray[currentInsertIndex] = character
            currentInsertIndex += 1
        }
        print(tryNum, currentInsertIndex)
    }
    
    func okButton(){
        tryNum += 1
    }
    
    func deleteButton(){
        if currentInsertIndex > 0 && (currentInsertIndex - 1) / maxStringLength == tryNum
        {
            currentInsertIndex -= 1
            gussesArray[currentInsertIndex] = ""
        }
        print(tryNum, currentInsertIndex)
    }
}
