        //
        //  InputScoreUIView.swift
        //  olnpickGolfer
        //
        //  Created by Yosuke Yoshida on 2021/04/11.
        //
        
        import SwiftUI
        import UIKit
        
        struct ScoreBoardUIView: View {
            
            @Binding var viewCode:String
            @State var c:Int = 0
            @State var memo:String = ""
            
            //TODO あとで設定したものを保存させる
            @State var rateOlynpic = 0
            @State var rateContest = 0
            @State var paddingNum:CGFloat = 0.5
            
            
            var body: some View {
                ScrollView {
                    VStack {
                        Text("スコア表").padding(.top)
                        
                        HStack(){
                            EachScoreSubView(playerName: "田中達也っっっっっっっっっs")
                            EachScoreSubView(playerName: "田中達也っっっっっっっっw")
                            EachScoreSubView(playerName: "田")
                            EachScoreSubView(playerName: "田中達也あああ")
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .padding()
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        
                        Text("金額表")
                        VStack{
                            MoneySubView(playerName: "田中達っs")
                            MoneySubView(playerName: "田中達也っっっっっっs")
                            MoneySubView(playerName: "田")
                            MoneySubView(playerName: "田中達")
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .padding()
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        
                        Spacer()
                    }
                }
            }
            
            struct EachScoreSubView: View {
                @State var playerName:String = ""
                
                var body: some View{
                    VStack(){
                        Text(playerName).padding(.vertical).lineLimit(1)
                        
                        Button(action: {
                            // action
                        }) { VStack {
                            Image(systemName: "minus.square")
                                .resizable()
                                .frame(width: Const.buttonSize, height: Const.buttonSize)
                            
                        }}.padding(.top)
                        
                        Text("0").font(.largeTitle).frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.vertical).lineLimit(1)
                        
                        Button(action: {
                            // action
                        }) { VStack {
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width:Const.buttonSize , height: Const.buttonSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        }.padding(.bottom)
                        
                        Button(action: {
                            // action
                        }) { ZStack {
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                            Text("13")
                          }
                          .frame(width: 40, height: 40)
                        }.padding(.bottom)

                        
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            
            struct MoneySubView: View {
                @State var playerName:String = ""
                var body: some View{
                    HStack{
                        Text(playerName).padding().lineLimit(1)
                        Label("00000", systemImage: "yensign.circle")
                        Text("1位")
                        Spacer()
                    }
                }
            }
        }
        
        struct ScoreBoardUIView_Previews: PreviewProvider {
            static var previews: some View {
                ScoreBoardUIView(viewCode: .constant(""))
            }
        }
