//
//  HistoryView.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/5/25.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: HistoryModel
    
    var body: some View {
        ZStack
        {
            Image("appBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            List{
                ForEach(history.historyArray){item in
                    VStack{
                        HStack{
                            Text(item.time)
                            Spacer()
                        }
                        .padding()
                        Text(item.answer)
                        Text(item.result)
                    }
                }
                
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
