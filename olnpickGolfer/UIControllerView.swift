//
//  UIControllerView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/04/19.
//

import SwiftUI

struct UIControllerView: View {
    
    @State var viewCode:String = getViewStatusCode()
    
    var body: some View {
        
        
        switch viewCode {
        
        case Const.nothigViewCode :
            ZStack{
                Color("Color_2")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    FirstSettingUIView(viewCode: $viewCode)
                    AdView()
                }
            }
            
        case Const.inputNameViewCode :
            VStack {
                MemberSelectUIView(viewCode: $viewCode)
                AdView()
            }
            
        case Const.scoreBoardViewCode:
            VStack {
                ParentScoreUIView(viewCode: $viewCode)
                AdView()
            }
            
            
        case Const.historyViewCode:
            VStack {
                HistoryUIView(viewCode: $viewCode)
                Spacer()
                AdView()
            }
            
        case Const.settingViewCode:

                
                VStack {
                    SettingUIView(viewCode: $viewCode)
                    AdView()
                }
                

            
        case Const.mainMenuViewCode:
            ZStack{
                Color("Color_2")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    MainMenuUIView(viewCode: $viewCode)
                    Spacer()
                    AdView()
                }
            }
        default :
            MemberSelectUIView(viewCode: $viewCode)
        }
    }
}

struct UIControllerView_Previews: PreviewProvider {
    static var previews: some View {
        UIControllerView()
    }
}
