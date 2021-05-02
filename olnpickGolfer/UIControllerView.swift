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
        
        ZStack {
            switch viewCode {
            
            case Const.nothigViewCode :
                FirstSettingUIView(viewCode: $viewCode)
                
            case Const.inputNameViewCode :
                MemberSelectUIView(viewCode: $viewCode)
                
            case Const.scoreBoardViewCode:
                ParentScoreUIView(viewCode: $viewCode)
                
            case Const.historyViewCode:
                HistoryUIView(viewCode: $viewCode)
                
            case Const.mainMenuViewCode:
                MainMenuUIView(viewCode: $viewCode)
                
            default :
                MemberSelectUIView(viewCode: $viewCode)
                
            }
            Color(red: Const.redRatio, green: Const.greenRatio, blue: Const.blueRatio, opacity: Const.opacity)
                .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct UIControllerView_Previews: PreviewProvider {
    static var previews: some View {
        UIControllerView()
    }
}
