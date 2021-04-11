//
//  InputScoreUIView.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/04/11.
//

import SwiftUI

struct InputScoreUIView: View {
    @Binding var isActive: Bool

    var body: some View {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("Modal View").padding()
                    Button("Close Modal") {
                        isActive = false
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
}


