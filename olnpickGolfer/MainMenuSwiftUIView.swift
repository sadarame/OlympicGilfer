//
//  MainMenuSwiftUIView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/05/02.
//

import SwiftUI

struct MainMenuUIView: View {
    
    @State var buttonText = "Button"
    @Binding var viewCode:String
    
    var body: some View {
            VStack(){
    
                
                Button(action:{
                    viewCode = Const.inputNameViewCode
                }){
                    Image("Fill_In_Score")
                        .renderingMode(.original)   // オリジナル画像を表示
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("開始").font(.largeTitle)
                }
                .frame(maxWidth: .infinity,maxHeight: 100)
                .background(Color(.white))
                .cornerRadius(50)
                .shadow(radius: 10)
                .padding()

                
                
                Button(action:{
                    viewCode = Const.historyViewCode
                }){
                    Image("history")
                        .renderingMode(.original)   // オリジナル画像を表示
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("履歴").font(.largeTitle)

                }
                .frame(maxWidth: .infinity,maxHeight: 100)
                .background(Color(.white))
                .cornerRadius(50)
                .shadow(radius: 10)
                .padding()
                
                Button(action:{
                    viewCode = Const.settingViewCode
                }){
                    HStack {
                    Image("Setting")
                        .renderingMode(.original)   // オリジナル画像を表示
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("設定").font(.largeTitle)
                    }
                }
                .frame(maxWidth: .infinity,maxHeight: 100)
                .background(Color(.white))
                .cornerRadius(50)
                .shadow(radius: 10)
                .padding()
      
            }
        
    }
}

struct MainMenuSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuUIView(viewCode: .constant(""))
    }
}
