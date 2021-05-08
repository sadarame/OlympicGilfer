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
    static let scoreBoardViewCode   = "2"
    static let resultScoreViewCode  = "3"
    static let historyViewCode      = "4"
    static let mainMenuViewCode     = "5"
    static let settingViewCode     = "6"
    //ViewDesign定数
    static let titleCardWidth:CGFloat  = 50.0
    static let buttonSize:CGFloat      = 50
    static let medalbuttonSize:CGFloat = 30
    //ボタンの判定値
    static let plus:Int  = 1
    static let minus:Int = 2
    //設定値
    static let defedaultRate:Int = 100
    //四人用
    static let tetu:Int  = 1
    static let dou:Int   = 2
    static let gin:Int   = 3
    static let kin:Int   = 4
    static let daiya:Int = 5
    //三人用
    static let dou_Three:Int   = 1
    static let gin_Three:Int   = 2
    static let kin_Three:Int   = 3
    static let daiya_Three:Int = 4
    //二人用
    static let gin_Two:Int   = 1
    static let kin_Two:Int   = 2
    static let daiya_Two:Int = 3
    
    static let redRatio     = 0.50   // 赤の割合
    static let greenRatio   = 0.75   // 緑の割合
    static let blueRatio    = 0.25  // 青の割合
    static let opacity      = 0.5 // 不透明度
}

