 //
 //  MoneyBoardUIView.swift
 //  olnpickGolfer
 //
 //  Created by Yosuke Yoshida on 2021/04/11.
 //
 
 import SwiftUI
 import RealmSwift
 import UIKit
 
 struct MoneyBoardUIView: View {
    
    @EnvironmentObject var store: ItemStore
    @State var rate = ""
    @Binding var viewCode:String
    
    var body: some View {
        ScrollView {
            VStack{
                ForEach(store.currentRoundData!.playerScoreList) { playerScore in
                    ColumSubView(playerScore: playerScore)
                }
            }.padding(.top)
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
