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
    static let statusCodeKey = "status"
    static let userNameKey = "userName"
    
    static let viewStatusKey = "viewStatus"
    
    //ViewStatusCode
    static let nothigViewCode       = ""
    static let firstSettingViewCode = "0"
    static let inputNameViewCode    = "1"
    static let inputScoreViewCode   = "2"
    static let resultScoreViewCode  = "3"
}

struct scoreData {
    
}

