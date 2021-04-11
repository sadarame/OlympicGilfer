//
//  ContentView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/02/09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name:String = ""
    @State private var item = getDataName()
    @State private var isShowingAlert = false
    @State private var showingAlert = false
    @State var text: String = ""
    @State private var selectionValue: Set<String>
        = []
    @State var searchArray = [String]()
    @EnvironmentObject var model: Model
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                TextField("検索", text: $name,onCommit: {
                    item = getDataName()
                    
                    if self.name == "" {
                        item = getDataName()
                    } else {
                        self.searchArray = item.filter{
                            if $0.localizedCaseInsensitiveContains(name){
                                return true
                            }
                            return false
                        }
                        item = searchArray
                    }
                })
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
                    
                    NavigationLink(destination: InputScoreUIView(), isActive: self.$model.secondViewPushed) {
                        Button(action: {
                            self.model.secondViewPushed = true
                        }) {
                            Text("次へ")
                        }
                        .padding()
                    }
                    
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
                                text = ""
                                item = getDataName()
                            }
                        }
                    )
                    .frame(width: 0, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                }
            }
        }
        .navigationTitle("タイトル")
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        
    }
    
    func rowRemove(delList:Set<String>) {
        var counter:Int = 0
        var isDel = false
        var tmpItem = getDataName()
        
        while counter < tmpItem.count {
            
            for data in delList {
                if tmpItem[counter] == data {
                    tmpItem.remove(at: counter)
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
        
        reWriteDataName(nameList: tmpItem)
        item = getDataName()
        self.name = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

