 //
 //  MoneyBoardUIView.swift
 //  olnpickGolfer
 //
 //  Created by Yosuke Yoshida on 2021/04/11.
 //
 
 import SwiftUI
 import RealmSwift
 import UIKit
 import Combine
 
 struct MoneyBoardUIView: View {
    
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
                          primaryButton: .cancel(Text("キャンセル")),      // 左ボタンの設定
                          secondaryButton: .default(Text("保存"),
                                                    action: {
                                                        viewCode = Const.historyViewCode
                                                        setViewStatusCode(statusCode: Const.mainMenuViewCode)
                                                    }))    // 右ボタンの設定
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
                }.padding(.horizontal)
            }
        }
    }
    
    struct ColumSubView: View {
        var playerScore:PlayerScore
        @EnvironmentObject var store: ItemStore
        @State var colorStr:Color = Color.blue
        
        var body: some View{
            
            
            HStack(spacing:0){
                MoneySubView(playerScore: playerScore)
//                let moneyAmount = store.getAmountMoney(point: playerScore.olynpicScore)
                let moneyAmount = playerScore.olynpicAmount
                if moneyAmount >= 0 {
                    Text("¥" + String(moneyAmount))
                        .font(.system(.title, design: .monospaced))
                        .frame(width:200,alignment: .trailing)
                        .lineLimit(1)
                        .padding(.trailing)
                        .foregroundColor(.blue)
                } else {
                    Text("¥" + String(moneyAmount))
                        .font(.system(.title, design: .monospaced))
                        .frame(width:200,alignment: .trailing)
                        .lineLimit(1)
                        .padding(.trailing)
                        .foregroundColor(.red)
                }
            }
            .background(Color.white)
            .padding()
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
    
 }
 
 struct MoneyBoardUIView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyBoardUIView(viewCode: .constant(""))
    }
 }
 
 extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
 }
