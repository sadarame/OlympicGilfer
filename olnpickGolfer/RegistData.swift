//
//  RegistData.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/02/11.
//

import Foundation
import RealmSwift

func registDataName(name:String) {
    
    var nameList = [String]()
    
    if let tmpList = UserDefaults.standard.array(forKey: Const.nameKey) {
        nameList = tmpList as! [String]
    }
    nameList.append(name)
    UserDefaults.standard.setValue(nameList, forKey: Const.nameKey)
}

func reWriteDataName(nameList:[String]){
    UserDefaults.standard.setValue(nameList, forKey: Const.nameKey)
}

func getDataName() -> Array<String> {
    
    if var strNameList = UserDefaults.standard.array(forKey: Const.nameKey) as? [String] {
        strNameList.sort()
        return strNameList
    } else {
        return []
    }
}

func setViewStatus(viewStutusCode:String) {
    UserDefaults.standard.setValue(viewStutusCode, forKey: Const.viewStatusKey)
}

func getViewStatus() -> String? {
    return UserDefaults.standard.string(forKey: Const.viewStatusKey)
    
}

func setUserName(userName:String) {
    UserDefaults.standard.setValue(userName, forKey: Const.userNameKey)
}

func getUserName() -> String {
    return UserDefaults.standard.string(forKey: Const.userNameKey) ?? ""
}

func setViewStatusCode(statusCode:String) {
    UserDefaults.standard.setValue(statusCode, forKey: Const.statusCodeKey)
}

func getViewStatusCode() -> String {
    return UserDefaults.standard.string(forKey: Const.statusCodeKey) ?? ""
}

func getCrtRoundId() -> String 	{
    return UserDefaults.standard.string(forKey: Const.crtRoundIdKey) ?? ""
}

func setCrtRoundId(crtRoundId:String) {
    UserDefaults.standard.setValue(crtRoundId, forKey: Const.crtRoundIdKey)
}

func getDefaultRate() -> Int {
    /// 専用メソッド
    //TODO 存在しない場合、０が返却される？？
    var rv:Int = Const.defedaultRate
    if UserDefaults.standard.integer(forKey: Const.defaultRateKey) != 0 {
        rv =  UserDefaults.standard.integer(forKey: Const.defaultRateKey)
    }
    return rv
}

func setDefaultRate(rate:Int) {
    UserDefaults.standard.setValue(rate, forKey: Const.defaultRateKey)
}







