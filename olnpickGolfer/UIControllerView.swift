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
        
        VStack{
            
            switch viewCode {
            
            case Const.nothigViewCode :
                FirstSettingUIView(viewCode: $viewCode)
                
            case Const.inputNameViewCode :
                MemberSelectUIView(viewCode: $viewCode)
                
            case Const.inputScoreViewCode:
                ScoreBoardUIView(viewCode: $viewCode)
                
            
            

            default :
                MemberSelectUIView(viewCode: $viewCode)
            }
        }
    }
}

struct UIControllerView_Previews: PreviewProvider {
    static var previews: some View {
        UIControllerView()
    }
}
