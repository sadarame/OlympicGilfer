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
    
    
    var body: some View {
          VStack{
            
            if viewStatus == "1" {
                FirstPageView(userName:$userName,viewStatus: $viewStatus)
            }else if viewStatus == "2" {
              SecondPageView(userName:$userName,viewStatus: $viewStatus)
            }else if viewStatus == "3" {
              ThirdPageView(userName:$userName,viewStatus: $viewStatus)
            }
          }
    }
      

   // 子View1
   struct FirstPageView: View {
    @Binding var userName : String
    @Binding var viewStatus : String
    
      var body: some View{
          VStack {
            Text("ゴルフオリンピックへようこそ！！").padding()
            Text("最初にユーザー情報を登録をしましょう。").padding()
            Text("登録した情報は、あとで変更できます。").padding()
            Button(action: {viewStatus="2"}, label: {Text("OK")})
          }
      }
   }

   // 子View2
   struct SecondPageView: View {
    
    @Binding var userName : String
    @Binding var viewStatus : String

      var body: some View{
          VStack {
             Text("お名前を教えてください。")
                    TextField("\("未設定")", text: self.$userName).font(.title).padding()
              Button(action: {viewStatus="3"}, label: {Text("保存")})
          }
      }
   }

   //子View3
   struct ThirdPageView: View {
    @Binding var userName : String
    @Binding var viewStatus : String
    
      var body: some View{
          VStack {
              Spacer()
              Text("設定が完了しました。").font(.title).bold()
              Spacer()
              Button(action: {}, label: {Text("OK")})
          }
      }
   }

}
struct FirstSettingUIView_Previews: PreviewProvider {
    static var previews: some View {
        FirstSettingUIView()
    }
}
