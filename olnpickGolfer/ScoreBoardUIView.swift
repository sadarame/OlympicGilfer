 //
 //  InputScoreUIView.swift
 //  olnpickGolfer
 //
 //  Created by Yosuke Yoshida on 2021/04/11.
 //
 
 import SwiftUI
 import RealmSwift
 import UIKit
 
 struct ScoreBoardUIView: View {

    @Binding var viewCode:String
    
    @State var roundData:RoundData =  getRoundData()
    @State var roundDataStruct:RoundDataStruct = RoundDataStruct(itemDB: getRoundData())

    var body: some View {
        
        ScrollView {
            HStack{
                Text("記録表").padding()
                Spacer()
                Text("レート")
                TextField("", text: $roundData.memo)
                    .frame(width: 70, height: 30, alignment: .leading)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action:{
                    //TODO:保存処理
                }){
                    Image(systemName: "tray.and.arrow.down")
                    Text("保存")
                }.padding(.trailing)
            }
            
            VStack{
                
                //TODO hasbleに準拠したストラクトでくりかえし処理を記載する。
                let playerScoreList = roundDataStruct.playerlScoreList
                ForEach(0..<roundDataStruct.playerlScoreList.count){ num in
                    ColumSubView(playerName: playerScoreList[num].playerName)
                }
                    ColumSubView(playerName: "aaa")
                    ColumSubView(playerName: "吉田")
                    ColumSubView(playerName: "洋介")
                    ColumSubView(playerName: "あああああああ")
                
                
                
                

            }
        }
    }
    
    struct MoneySubView: View {
        @State var playerName:String = ""
        var body: some View{
            VStack{
                HStack {
                    Text(playerName).padding(.vertical).lineLimit(1).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Button(action: {
                        // action
                    }) { VStack {
                        Image(systemName: "minus.square")
                            .resizable()
                            .frame(width: Const.buttonSize, height: Const.buttonSize)
                    }}
                    Button(action: {
                        // action
                    }) { VStack {
                        Image(systemName: "plus.app")
                            .resizable()
                            .frame(width:Const.buttonSize , height: Const.buttonSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }}
                }.padding(.horizontal)
                
                HStack(spacing: 0) {
                    ButtonSubView(buttonName: "ダ",buttonColor: Color.black)
                    ButtonSubView(buttonName: "金",buttonColor: Color.yellow)
                    ButtonSubView(buttonName: "銀",buttonColor: Color.gray)
                    ButtonSubView(buttonName: "銅",buttonColor: Color.orange)
                    ButtonSubView(buttonName: "鉄",buttonColor: Color.blue)
                }
            }
        }
    }
    
    struct ButtonSubView: View {
        @State var buttonName:String = ""
        @State var buttonColor:Color
        
        var body: some View{
            Button(action: {
                //
            }) {
                Text(buttonName).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            }
            .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .border(Color.white,width: 1)
            .background(buttonColor)
        }
    }
    
    struct ColumSubView: View {
        @State var playerName:String = ""
        
        var body: some View{
            HStack{
                MoneySubView(playerName: playerName)
                Text("0").font(.largeTitle).frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding().lineLimit(1)
            }                       .frame(maxWidth: .infinity)
            .background(Color.white)
            .padding(.top)
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
