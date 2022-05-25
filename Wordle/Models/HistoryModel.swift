//
//  HistoryModel.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/5/25.
//

import Foundation
import SwiftUI

struct historyData: Identifiable ,Codable{
    var id = UUID()
    var time: String
    var answer: String
    var result: String
}

class HistoryModel: ObservableObject{
    @Published var historyNum = 0
    @AppStorage("history") var historySave: Data?
    
    @Published var historyArray = [historyData]() {
        didSet {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(historyArray)
                historySave = data
            } catch {
                print("error = ")
                print(error)
            }
        }
    }
}
