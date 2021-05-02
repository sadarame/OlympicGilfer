 //
 //  InputScoreUIView.swift
 //  olnpickGolfer
 //
 //  Created by Yosuke Yoshida on 2021/04/11.
 //
 
 import SwiftUI
 import RealmSwift
 import UIKit
 import Combine
 
 struct ScoreBoardUIView: View {
    
    @EnvironmentObject var store: ItemStore
    @State var rate = ""
    @Binding var viewCode:String
    @State private var showingAlert = false 
    
    var body: some View {
        ScrollView {
            HStack(spacing:0){
                Text("レート").padding(.leading)
                TextField("", text: $rate,onCommit:{
                    store.rateChange(rate: Int(rate) ?? 0)
                })
                    .onAppear {
                        if String(store.currentRoundData!.rate) == "0" {
                            rate = String(getDefaultRate())
                        } else {
                            rate = String(store.currentRoundData!.rate)
                        }
                    }
                    //oncahnage
                    .frame(width: 70, height: 30, alignment: .leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onReceive(Just(rate)) { newValue in let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            rate = filtered
                        }
                    }
                Spacer()
                Button(action:{
                    self.showingAlert = true
                }){
                    Image(systemName: "tray.and.arrow.down")
                    Text("終了")
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("保存しますか"),
                          primaryButton: .cancel(Text("キャンセル")),
                          secondaryButton: .default(Text("保存"),
                                                    action: {
                                                        setViewStatusCode(statusCode: Const.mainMenuViewCode)
                                                        viewCode = Const.historyViewCode
                                                    }))
                }
                .padding(.trailing)

            }
            .padding()
            VStack{
                ForEach(store.currentRoundData!.playerScoreList) { playerScore in
                    ColumSubView(playerScore: playerScore)
                }
            }
        }
    }
    
    struct MoneySubView: View {
        var playerScore:PlayerScore
        @EnvironmentObject var store: ItemStore
        
        var body: some View{
            VStack{
                HStack {
                    Text(playerScore.playerName)
                        .padding(.vertical)
                        .lineLimit(1)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Button(action: {
                        // action
                        store.scoreChange(playerScore: playerScore,type:Const.minus)
                    }) { VStack {
                        Image(systemName: "minus.square")
                            .resizable()
                            .frame(width: Const.buttonSize, height: Const.buttonSize)
                    }}
                    Button(action: {
                        store.scoreChange(playerScore: playerScore,type:Const.plus)
                    }) { VStack {
                        Image(systemName: "plus.app")
                            .resizable()
                            .frame(width:Const.buttonSize , height: Const.buttonSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }}
                }.padding(.horizontal)
                
                HStack(spacing:0) {
                    
                    ButtonSubView(buttonName: "ダ",buttonColor: Color.black,playerScore: playerScore)
                    ButtonSubView(buttonName: "金",buttonColor: Color.yellow,playerScore: playerScore)
                    ButtonSubView(buttonName: "銀",buttonColor: Color.gray,playerScore: playerScore)
                   
                    //三人以上いたら表示
                    if store.currentRoundData!.peoples >= 3 {
                        ButtonSubView(buttonName: "銅",buttonColor: Color.orange,playerScore: playerScore)
                    }
                    //四人以上いたら表示
                    if store.currentRoundData!.peoples >= 4 {
                        ButtonSubView(buttonName: "鉄",buttonColor: Color.blue,playerScore: playerScore)
                    }
                    Spacer()
                }
            }
        }
    }
    
    struct ButtonSubView: View {
        @EnvironmentObject var store: ItemStore
        var buttonName:String
        var buttonColor:Color
        var playerScore:PlayerScore
        
        var body: some View{
            Button(action: {
                switch buttonName {
                case "ダ":
                    var amountTmp:Int = 0
                    if store.currentRoundData!.peoples == 4 {
                        amountTmp = Const.daiya
                    } else if store.currentRoundData!.peoples == 3 {
                        amountTmp = Const.daiya_Three
                    } else if store.currentRoundData!.peoples == 2 {
                        amountTmp = Const.daiya_Two
                    }
                    store.scoreChange(playerScore: playerScore,amount:amountTmp)
                case "金":
                    var amountTmp:Int = 0
                    if store.currentRoundData!.peoples == 4 {
                        amountTmp = Const.kin
                    } else if store.currentRoundData!.peoples == 3 {
                        amountTmp = Const.kin_Three
                    } else if store.currentRoundData!.peoples == 2 {
                        amountTmp = Const.kin_Two
                    }
                    store.scoreChange(playerScore: playerScore,amount:amountTmp)
                case "銀":
                    var amountTmp:Int = 0
                    if store.currentRoundData!.peoples == 4 {
                        amountTmp = Const.gin
                    } else if store.currentRoundData!.peoples == 3 {
                        amountTmp = Const.gin_Three
                    } else if store.currentRoundData!.peoples == 2 {
                        amountTmp = Const.gin_Two
                    }
                    store.scoreChange(playerScore: playerScore,amount:amountTmp)
                case "銅":
                    var amountTmp:Int = 0
                    if store.currentRoundData!.peoples == 4 {
                        amountTmp = Const.dou
                    } else if store.currentRoundData!.peoples == 3 {
                        amountTmp = Const.dou_Three
                    }
                    store.scoreChange(playerScore: playerScore,amount:amountTmp)
                case "鉄":
                    store.scoreChange(playerScore: playerScore,amount:Const.tetu)
                default:break
                }
            }) {
                Text(buttonName).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            }
            .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .border(Color.white,width: 1)
            .background(buttonColor)
        }
    }
    
    struct ColumSubView: View {
        var playerScore:PlayerScore
        @EnvironmentObject var store: ItemStore
        
        var body: some View{
            HStack(spacing:0){
                MoneySubView(playerScore: playerScore)
                Text(String(playerScore.olynpicScore))
                    .font(.system(.title, design: .monospaced))
                    .frame(width:50,alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .lineLimit(1)
                    .onAppear() {
                        print(playerScore.playerName)
                    }
            }
            .background(Color.white)
            .padding(.horizontal)
            .padding(.horizontal)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
 }
 
 struct SwiftUIViewtet_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoardUIView(viewCode: .constant(""))
    }
 }
