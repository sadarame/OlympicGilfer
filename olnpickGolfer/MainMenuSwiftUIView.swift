//
//  MainMenuSwiftUIView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/05/02.
//

import SwiftUI

struct MainMenuUIView: View {
    
    @State var buttonText = "Button"
    @Binding var viewCode:String
    
    var body: some View {
        VStack{
            Button("開始") { viewCode = Const.inputNameViewCode }
            Button("履歴") { viewCode = Const.historyViewCode }
        }
    }
}

struct MainMenuSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuUIView(viewCode: .constant(""))
    }
}
