//
//  StartView.swift
//  Wordle
//
//  Created by 陳昕喬 on 2022/5/1.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var answer: answerModel
    @EnvironmentObject var history: HistoryModel
    @EnvironmentObject var word: wordModel
    
    var body: some View {
        NavigationView {
            TimelineView(.periodic(from: .now, by: 0.5)){ timeline in
                let components = Calendar.current.dateComponents([.second], from: answer.getLastTime(), to: Date())
                ZStack{
                    Image("appBackground")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    VStack{
                        Text("Wordle")
                            .font(.custom("PressStart2P-Regular", size: 30))
                            .foregroundColor(.white)
                        Text("For")
                            .font(.custom("PressStart2P-Regular", size: 30))
                            .foregroundColor(.white)
                            .padding()
                        Text("Computer Science")
                            .font(.custom("PressStart2P-Regular", size: 20))
                            .foregroundColor(.white)
                        
                        if (300 - components.second! >= 0 && history.historyNum > 0)
                        {
                            ZStack
                            {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                Text(String(300 - components.second!))
                                    .font(.custom("PressStart2P-Regular", size: 20))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 180, height: 50)
                            .offset(x: 0, y: 50)
                        }
                        else{
                            NavigationLink {
                                GameView()
                            } label: {
                                ZStack
                                {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .opacity(0.7)
                                    Text("Start")
                                        .font(.custom("PressStart2P-Regular", size: 20))
                                        .foregroundColor(.white)
                                }
                                .frame(width: 180, height: 50)
                            }
                            .offset(x: 0, y: 50)
                        }
                        
                        NavigationLink {
                            SettingView()
                        } label: {
                            ZStack
                            {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                                Text("Setting")
                                    .font(.custom("PressStart2P-Regular", size: 20))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 180, height: 50)
                        }
                        .offset(x: 0, y: 50)
                        
                        HStack{
                            NavigationLink {
                                InformationView()
                            } label: {
                                ZStack{
                                    Image(systemName: "square.fill")
                                        .resizable()
//                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.white)
                                    
                                    Image(systemName: "questionmark.square.fill")
                                        .resizable()
//                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.black)
                                }
                            }
                            
                            Spacer()
                            
                            NavigationLink {
                                HistoryView()
                            } label: {
                                ZStack{
                                    Image(systemName: "square.fill")
                                        .resizable()
//                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.black)
                                    Image(systemName: "clock")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.white)
                                }
                            }

                        }
                        .frame(width: 180, height: 60)
                        .offset(x: 0, y: 50)
                    }
                }
            }
            .onAppear
            {
//                history.historyNum = history.historyArray.count
//                print(history.historyNum)
                answer.restart()
                word.restart()
                word.setMaxStringLength(maxStringLength: answer.answerWord.count)
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
