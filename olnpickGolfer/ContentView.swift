//
//  ContentView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/02/09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    var body: some View {
       VStack {
            TextField("検索", text: $name)
                .padding()
                // 入力域のまわりを枠で囲む
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            List {
                
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                
            }
            Spacer()
        
        HStack {
            Button(action: alertD) {
                Text("追加")
                .padding()
            }
            
            Spacer()
            
            Button(action: alertD) {
                Text("次へ")
                .padding()
            }
        }
    }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
