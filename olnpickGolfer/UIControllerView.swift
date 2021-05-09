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
                FirstSettingUIView(viewCode: $viewCode)
            }
            
        case Const.inputNameViewCode :
            MemberSelectUIView(viewCode: $viewCode)
            
        case Const.scoreBoardViewCode:
            ParentScoreUIView(viewCode: $viewCode)
            
        case Const.historyViewCode:
            HistoryUIView(viewCode: $viewCode)
            
        case Const.settingViewCode:
            SettingUIView(viewCode: $viewCode)
            
        case Const.mainMenuViewCode:
            ZStack{
                    Color("Color_2")
                        .edgesIgnoringSafeArea(.all)
                
                MainMenuUIView(viewCode: $viewCode)
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
