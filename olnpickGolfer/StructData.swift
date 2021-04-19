//
//  StructData.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/02/11.
//

import Foundation

struct Monster: Equatable {
    let name: String
    let description: String
}


struct Const {
    static let nameKey = "name"
    static let viewStatusKey = "status"
    static let userNameKey = "userName"
    
    //ViewStatus
    static let inputNameView = "1"
    static let inputScoreView = "2"
    static let resultScoreView = "3"
}

