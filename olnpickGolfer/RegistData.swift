//
//  RegistData.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/02/11.
//

import Foundation

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