//
//  ContentView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/02/09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    @State private var item = getDataName()
    @State private var isShowingAlert = false
    @State private var showingAlert = false
    @State var text: String = ""
    @State private var selectionValue: Set<String>
        = []
    
    
    var body: some View {
        
        VStack {
            TextField("検索", text: $name)
                .padding()
                // 入力域のまわりを枠で囲む
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            List (selection: $selectionValue) {
                ForEach(item, id: \.self) { item in
                    Text(item)
                }
            }
            .environment(\.editMode, .constant(.active))
            
            Spacer()
            
            HStack {
                Button("追加") { isShowingAlert = true }
                    .padding()
                
                if !item.isEmpty {
                    Button("削除") {
                        rowRemove(delList: selectionValue)
                        selectionValue = []
                    }
                        .padding()
                }
                    
                Spacer()
                
                TextFieldAlertView(
                    text: $text,
                    isShowingAlert: $isShowingAlert,
                    placeholder: "",
                    isSecureTextEntry: false,
                    title: "名前登録",
                    message: "名前を入力してください",
                    leftButtonTitle: "キャンセル",
                    rightButtonTitle: "登録",
                    leftButtonAction: nil,
                    rightButtonAction: {
                        if item.contains(text) {
                            alertD()
                        } else {
                            registDataName(name: text)
                            item = getDataName()
                        }
                    }
                )
                .frame(width: 0, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    func rowRemove(delList:Set<String>) {
        var counter:Int = 0
        var isDel = false
        
        
        while counter < item.count {

            for data in delList {
                if item[counter] == data {
                    item.remove(at: counter)
                    isDel = true
                }
            }
            if isDel {
                counter = 0
                isDel = false
            } else {
                counter+=1
            }
        }
        
        reWriteDataName(nameList: item)
        item = getDataName()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

