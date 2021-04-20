//
//  ContentView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/02/09.
//

import SwiftUI

struct SelectConpanionUIView: View {
    
    @State private var name:String = ""
    @State private var item = getDataName()
    @State private var isShowingAlert = false
    @State private var showingAlert = false
    @State var text: String = ""
    @State private var selectionValue: Set<String>
        = []
    @State var searchArray = [String]()
    
    @State private var isShowing = false
    
    @Binding var viewCode:String
    
    var body: some View {
        
        VStack {
            HStack{
                Text("同伴者を追加・選択してください。").padding(.leading)
                Spacer()
            }
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
            }).padding()
            // 入力域のまわりを枠で囲む
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            List (selection: $selectionValue) {
                ForEach(item, id: \.self) { item in
                    Text(item)
                }
            }.environment(\.editMode, .constant(.active))
            
            Spacer()
            
            HStack {
                //追加ボタン
                Button("追加") { isShowingAlert = true }.padding()
                //削除ボタン制御
                if !item.isEmpty {
                    Button("削除") {
                        rowRemove(delList: selectionValue)
                        selectionValue = []
                    }
                    .padding()
                }
                Spacer()
                //次へボタン
                Button("次へ") {
                    if inputCheck(selectedList: selectionValue) {
                        isShowing = true
                        //TODO 選択した値を保存する処理
                        viewCode = Const.inputScoreViewCode
                        
                    } else {
                        self.showingAlert = true
                    }
    
                    
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("入力エラー"),message: Text("１〜３人を選択してください"))
                }
                
                //名前入力ダイアログ
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
                ).frame(width: 0, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    //同伴者追加
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
    
    func inputCheck(selectedList:Set<String>)->Bool{
        var rtVal:Bool
        if selectedList.count <= 0 ||  selectedList.count > 3 {
            rtVal =  false
        } else {
            rtVal = true
        }
        return rtVal
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SelectConpanionUIView(viewCode: .constant(""))
    }
}

