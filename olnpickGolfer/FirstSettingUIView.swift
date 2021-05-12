//
//  FirstSettingUIView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/04/18.
//

import SwiftUI

struct FirstSettingUIView: View {
    
    @State var userName:String = ""
    @State var viewStatus:String = "1"
    @Binding var viewCode:String
    
    var body: some View {
        
        VStack{
            if viewStatus == "1" {
                FirstPageView(userName:$userName,viewStatus: $viewStatus)
            }else if viewStatus == "3" {
                ThirdPageView(userName:$userName,viewCode:$viewCode)
            }else if viewStatus == "4" {
                //                self.viewCode = Const.inputNameViewCode
            }
        }
    }
    
    
    // 子View1
    struct FirstPageView: View {
        @Binding var userName : String
        @Binding var viewStatus : String
        
        var body: some View{
            VStack {
                Text("ゴルフオリンピック記録帳へようこそ！！")
                    .padding(40)
                    .font(.largeTitle)
                    .shadow(color: Color.white, radius: 100, x: 0, y: 0)
                Text("名前を設定してください")
                    .padding(.horizontal)
                    .font(.largeTitle)
                    .shadow(color: Color.white, radius: 100, x: 0, y: 0)
                    .cornerRadius(50)
                TextField("\("未設定")", text: self.$userName)
                    .font(.largeTitle)
                    .background(Color("Color_Dark"))
                    .padding()
                Button(action: {viewStatus="3";setUserName(userName: userName)}, label: {Text("保存")})
                    .frame(width:100,height: 50)
                    .background(Color(.white))
                    .cornerRadius(50)
                    .shadow(radius: 10)
                    .padding()
            }
            
        }
    }
    
    
    //子View3
    struct ThirdPageView: View {
        @Binding var userName : String
        @Binding var viewCode:String
        
        var body: some View{
            VStack {
                Text("設定が完了しました。").font(.title).bold()
                Button(action: {
                    viewCode=Const.mainMenuViewCode
                    setViewStatusCode(statusCode: Const.mainMenuViewCode)
                }, label: {Text("OK")})
                .frame(width:100,height: 50)
                .background(Color(.white))
                .cornerRadius(50)
                .shadow(radius: 10)
                .padding()
            }
        }
    }
}

//struct FirstSettingUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstSettingUIView()
//    }
//}
