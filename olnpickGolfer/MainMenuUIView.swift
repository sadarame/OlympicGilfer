//
//  MainMenuUIView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/04/24.
//

import SwiftUI

struct MainMenuUIView: View {
    @Binding var viewCode:String
    
    var body: some View {
        VStack{
            Button("スコア入力"){
            }
            Button("履歴確認"){
            }
            Button("設定"){
            }
            
        }
        
    }
    
}


struct MainMenuUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuUIView(viewCode: .constant(""))
    }
}
