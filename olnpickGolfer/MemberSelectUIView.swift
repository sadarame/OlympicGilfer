//
//  ContentView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/02/09.
//

import SwiftUI
import RealmSwift
import Foundation

struct MemberSelectUIView: View {
    @EnvironmentObject var store: ItemStore
    
    @State private var name:String = ""
    @State private var item = getDataName()
    @State private var isShowingAlert = false
    @State private var showingAlert = false
    @State var text: String = ""
    @State private var selectionValue: Set
    <String>
        = []
    @State var searchArray = [String]()
    
    @Binding var viewCode:String
    
    var body: some View {
        
        VStack {
            HStack{
                Text("同伴者を追加・選択してください。").padding(.leading).padding(.top)
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
                        //TODO 選択した値を保存する処理
                        setMembers(selectedList: selectionValue)
                        viewCode = Const.scoreBoardViewCode
                        setViewStatusCode(statusCode: viewCode)
                        
                    } else {
                        self.showingAlert = true
                    }
        
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("入力エラー"),message: Text("１〜３人を選択してください"))
                }
                .padding()
                
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
    
    func setMembers(selectedList:Set<String>){
        //主キー生成
        let id: String = NSUUID().uuidString
        //ラウンド生成
        let roundData = RoundData()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        //　スコア表データの作成
        //　自分のデータを設定
        // 自身のスコア表を作成
        var playerScore = PlayerScore()
        playerScore.roundId = id
        playerScore.playerName = getUserName()
        //ラウンドデータにスコア表を追加
        roundData.playerScoreList.append(playerScore)
        
        for seleted in selectedList {
            //スコア表を作成
            playerScore = PlayerScore()
            //スコア表に名前とidを記入
            playerScore.roundId = id
            playerScore.playerName = seleted
            //ラウンドデータにスコア表を追加
            roundData.playerScoreList.append(playerScore)
        }
        
        //ラウンドデータの作成
        roundData.roundId = id
        roundData.peoples = selectedList.count + 1
        //ラウンドデータの保存
        store.create(roundData:roundData)
        //ラウンドキーの保存
        setCrtRoundId(crtRoundId: id)
        
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

struct MemberSelectUIView_Previews: PreviewProvider {
    static var previews: some View {
        MemberSelectUIView(viewCode: .constant(""))
    }
}

