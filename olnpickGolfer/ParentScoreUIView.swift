//
//  SwiftUIView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/05/01.
//

import SwiftUI
import Combine

struct ParentScoreUIView: View {
    
    @State  var selectedView = 0
    @Binding var viewCode:String
    
    var body: some View {
        Text("スワイプで切り替えられます。。").padding(.top)
        Picker(selection: $selectedView, label: Text("Picker")) {
            Text("点数").tag(0)
            Text("金額").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal)
        .padding(.bottom)
        
        VStack {
            
            //共通ヘッダー
            CommonHeaderSubView(viewCode: $viewCode)
            
            switch selectedView {
            case 0:
                ScoreBoardUIView(viewCode: $viewCode)
            case 1:
                MoneyBoardUIView(viewCode: $viewCode)
            default:
                ScoreBoardUIView(viewCode: $viewCode)
            }
        }
        .gesture(DragGesture()
                    .onEnded({ value in
                        if (abs(value.translation.width) < 10) { return } // too small movement, ignore note: 10 is default value for minimumDistance
                        if (value.translation.width < 0 ) {
                            // swiped to left
                            selectedView = 1
                        } else if (value.translation.width > 0 ) {
                            // swiped to right
                            selectedView = 0
                        }
                    })
        )
        
    }
    
    struct CommonHeaderSubView: View {
        @EnvironmentObject var store: ItemStore
        @State var rate = ""
        @State private var showingAlert = false
        @Binding var viewCode:String
        
        var body: some View{
            
            HStack(spacing:0){
                        Text("レート:").padding(.leading)
                        TextField("", text: $rate,onCommit:{
                            store.rateChange(rate: Int(rate) ?? 0)
                        })
                            .onAppear {
                                if String(store.currentRoundData!.rate) == "0" {
                                    rate = String(getDefaultRate())
                                } else {
                                    rate = String(store.currentRoundData!.rate)
                                }
                            }
                            //oncahnage
                            .frame(width: 70, height: 30, alignment: .leading)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onReceive(Just(rate)) { newValue in let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    rate = filtered
                                }
                            }
                        Spacer()
                        Button(action:{
                            self.showingAlert = true
                        }){
                            Image(systemName: "tray.and.arrow.down")
                            Text("終了")
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("保存しますか"),
                                  primaryButton: .cancel(Text("キャンセル")),
                                  secondaryButton: .default(Text("保存"),
                                                            action: {
                                                                setViewStatusCode(statusCode: Const.mainMenuViewCode)
                                                                viewCode = Const.historyViewCode
                                                            }))
                        }
                        .padding(.trailing)

                    }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ParentScoreUIView(viewCode: .constant(""))
    }
}
