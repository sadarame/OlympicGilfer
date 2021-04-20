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
    
    //UserDefault用キー項目
    static let nameKey = "name"
    static let statusCodeKey = "status"
    static let userNameKey = "userName"
    static let viewStatusKey = "viewStatus"
    static let scoreDataKey = "scoreDataK"
    
    //ViewStatusCode
    static let nothigViewCode       = ""
    static let firstSettingViewCode = "0"
    static let inputNameViewCode    = "1"
    static let inputScoreViewCode   = "2"
    static let resultScoreViewCode  = "3"
}

struct scoreData:Codable {
    let playerName1:String
    var olynpicScore1:Int = 0
    var olynpicAmount1:Int = 0
    var otherScore1:Int = 0
    var otherAmount1:Int = 0
    
 
}

