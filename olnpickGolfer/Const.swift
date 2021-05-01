//
//  StructData.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/02/11.
//

import Foundation
import UIKit

struct Const {
    //UserDefault用キー項目
    static let nameKey = "name"
    static let statusCodeKey = "status"
    static let userNameKey = "userName"
    static let viewStatusKey = "viewStatus"
    static let crtRoundIdKey = "crtRoundId"
    static let defaultRateKey = "defaultRate"
    //ViewStatusCode
    static let nothigViewCode       = ""
    static let firstSettingViewCode = "0"
    static let inputNameViewCode    = "1"
    static let inputScoreViewCode   = "2"
    static let resultScoreViewCode  = "3"
    //ViewDesign定数
    static let titleCardWidth:CGFloat = 50.0
    static let buttonSize:CGFloat = 50
    static let medalbuttonSize:CGFloat = 30
    //ボタンの判定値
    static let plus:Int = 1
    static let minus:Int = 2
    //設定値
    static let defedaultRate:Int = 100
    
    
}

