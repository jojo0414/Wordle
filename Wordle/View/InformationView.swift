//
//  InformationView.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/5/22.
//

import SwiftUI

struct InformationView: View {
    
    var body: some View {
        ZStack{
            Image("appBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                VStack(){
                    InformationTextView1()
                    InformationTextView2()
                        .padding(5)
                    InformationTextView3()
                }
                .foregroundColor(.white)
//                .scaledToFit()
//                .frame(width: 350, height: 500)
                
//                VStack{
//                    Text("Wordle For")
//                        .padding()
//                    Text("Computer Science")
//                }
//                .font(.custom("PressStart2P-Regular", size: 20))
//                .foregroundColor(.white)
//                .padding()
            }
            .offset(x: 0, y: -30)
        }
    }
}

struct InformationTextView1: View{
    var body: some View{
        VStack(alignment: .leading){
                Text("這是專門給資工系的 wordle 歐～")
                Text("裡面的單字是大一到大四\n上課會聽過的詞")
                Text("至於沒有聽過的話就該反省了！")
                Text("這些詞是不會有什麼資工系的刻板印象的")
                Text("像是什麼格子襯衫什麼宅宅")
                Text("這些詞是不會出現的...吧？")
        }
    }
}

struct InformationTextView2: View{
    var body: some View{
        VStack(alignment: .leading)
        {
            Text("答案的單字的最小長度、猜測的次數")
            Text("都可以在設定頁面調整")
            Text("如果對自己的英文單字量")
            Text("沒有自信的可以多加利用這個功能歐～")
            Text("猜測單字的時候直接使用下面的小鍵盤輸入就好")
            Text("輸入完成後按下 OK 鍵")
            Text("就會顯示輸入的結果")
            Text("請玩家")
            Text("利用這些結果來猜測正確的單字是什麼吧！")
        }
    }
}

struct InformationTextView3: View{
    var body: some View{
        VStack(alignment: .leading){
            Text("順便一提")
            Text("在設定介面也可以修改結果的顏色歐")
            Text("像是正確位置正確字母預設是綠色")
            Text("如果覺得這個顏色太「吉利」的承受不住的話")
            Text("可以將顏色改成別的你喜歡的顏色歐～")
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
