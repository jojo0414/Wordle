//
//  Keyboard.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/4/16.
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var wordModel: wordModel
    var keyboardRaw1 = "QWERTYUIOP".map{String($0)}
    var keyboardRaw2 = "ASDFGHJKL".map{String($0)}
    var keyboardRaw3 = "ZXCVBNM".map{String($0)}
    
    var body: some View {
        VStack(alignment: .center){
            HStack(spacing: 2){
                ForEach(keyboardRaw1, id: \.self){ item in
                    KeyboardButtonView(character: item)
                }
            }
            HStack(spacing: 2){
                ForEach(keyboardRaw2, id: \.self){ item in
                    KeyboardButtonView(character: item)
                }
            }
            HStack(spacing: 2){
                Button {
                    wordModel.okButton()
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
                    ForEach(keyboardRaw3, id: \.self){item in
                        KeyboardButtonView(character: item)
                    }
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
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
