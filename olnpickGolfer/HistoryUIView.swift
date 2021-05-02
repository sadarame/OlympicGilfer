//
//  SwiftUIView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/05/02.
//

import SwiftUI
import UIKit

struct HistoryUIView: View {
    @EnvironmentObject var store: ItemStore
    @Binding var viewCode:String
    @State var expenses:Int = 0
    
    var body: some View {
        
        HStack{
            Text("履歴").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
            Spacer()
        }
        List {
            Section(header: sectionHeaderView) {
                ForEach(store.items) { item in
                    VStack{
                        HStack{
                            Text(StringToDate(date: item.roundDate, format: "yyyy/MM/dd"))
                            Button("詳細") {
                                store.historyToScoreBoard(roundid: item.roundId)
                                viewCode = Const.scoreBoardViewCode
                            }
                        }
                    }
                }
                ////// 行削除操作時に呼び出す処理の指定
                .onDelete(perform: rowRemove)
            }
        }.navigationTitle("履歴")
        Spacer()
        Button("メニューへ") { viewCode = Const.mainMenuViewCode }
        
    }
    var sectionHeaderView: some View {
        HStack {
            Spacer()
        }
    }
    func rowRemove(offsets: IndexSet) {
        store.delete(roundId: store.items[offsets.first!].roundId)
    }
}

struct HistoryUIView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryUIView(viewCode: .constant(""))
    }
}
