//
//  SwiftUIView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/05/04.
//

import SwiftUI

struct SettingUIView: View {
    @State private var isOn = false
        @State private var pickerSelection = 0
    @Binding var viewCode:String
    @State var username:String = "0"
        
        let languages: [String] = [
            "English",
            "Japanease",
            "French",
            "Chinese"
        ]
    var body: some View {
        NavigationView {
                  Form {
                      HStack {
                          Image(systemName: "person.circle")
                          Button("Sign in to your iPhone", action: {})
                      }
                      Section(header: Text("General")) {
                          HStack {
                              Text("Airplane Mode")
                              Spacer()
                              Toggle(isOn: $isOn) {
                                  EmptyView()
                              }
                          }
                        HStack{
                            Text("ユーザ名：")
                            Spacer()
                            
                            TextField("Username", text: $username)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                          HStack {
                              Picker(selection: $pickerSelection, label: Text("Language")) {
                                  ForEach(0..<self.languages.count) { index in
                                      Text(self.languages[index])
                                  }
                              }
                          }
                      }
                      Section(header: Text("About"), footer: Text("copyright ©︎ 20XX-20XX Apple All Rights Reserved.")) {
                          HStack {
                              Text("Device Name")
                              Spacer()
                              Text(UIDevice.current.name)
                          }
                          HStack {
                              Text("Operating System")
                              Spacer()
                              Text(UIDevice.current.systemName)
                          }
                          HStack {
                              Text("Version")
                              Spacer()
                              Text(UIDevice.current.systemVersion)
                          }
                      }
                  }
                  .navigationBarTitle("Settings")
              }
          }
      }

struct SettingUIView_Previews: PreviewProvider {
    static var previews: some View {
        SettingUIView(viewCode: .constant(""))
    }
}
