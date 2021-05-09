//
//  SwiftUIView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/05/04.
//

import SwiftUI
import Combine

struct SettingUIView: View {
    
    @Binding var viewCode:String
    
    @State var username:String = getUserName()
    @State var initialRate:String = String(getDefaultRate())
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("一般")) {
                    HStack{
                        Text("ユーザ名：")
                        Spacer()
                        TextField("ユーザー名", text: $username,onCommit:{
                            setUserName(userName: username)
                        })
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .multilineTextAlignment(.trailing)
                    }
                    
                    
                    HStack{
                        Text("初期レート：")
                        Spacer()
                        TextField("レート", text: $initialRate,onCommit:{
                            setDefaultRate(rate: Int(initialRate) ?? 0)
                        })
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .multilineTextAlignment(.trailing)
                        .onReceive(Just(initialRate)) { newValue in let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                initialRate = filtered
                            }
                        }
                        
                    }
                }
            }
            .navigationBarTitle("設定", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button("戻る"){
                                        viewCode = Const.mainMenuViewCode
                                    })
        }
    }
}
struct SettingUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingUIView(viewCode: .constant(""))
    }
}
