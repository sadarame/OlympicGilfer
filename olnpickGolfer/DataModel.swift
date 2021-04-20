//
//  File.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/04/20.
//

import Foundation
import RealmSwift

class RoundData: Object {
    @objc dynamic var roundId = ""
    @objc dynamic var roundDate = Date()
    @objc dynamic var peoples:Int = 0
    @objc dynamic var memo = ""
    
    let playersScores = List<PlayerlScore>()
    
    override static func primaryKey() -> String? {
        return "roundId"
    }
}

class PlayerlScore: Object {
    
    @objc dynamic var roundId = ""
    @objc dynamic var playerName = ""
    @objc dynamic var olynpicScore = 0
    @objc dynamic var olynpicAmount = 0
    @objc dynamic var draconNirconScore = 0
    @objc dynamic var draconNirconAmount = 0
    
    override static func primaryKey() -> String? {
        return "playerName"
    }
}
