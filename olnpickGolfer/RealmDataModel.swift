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
    @objc dynamic var roundDate:Date = Date()
    @objc dynamic var peoples:Int = 0
    @objc dynamic var memo = ""
    @objc dynamic var rate = getDefaultRate()
    
    let playerScoreList = List<PlayerScore>()
    
    override static func primaryKey() -> String? {
        return "roundId"
    }
}

class PlayerScore: Object,Identifiable {
    
    @objc dynamic var roundId = ""
    @objc dynamic var playerName = ""
    @objc dynamic var olynpicScore = 0
    @objc dynamic var olynpicAmount = 0
    @objc dynamic var draconNirconScore = 0
    @objc dynamic var draconNirconAmount = 0
    @objc dynamic var roundDate = Date()
    
}
func getRoundData() -> RoundData {
    
//    let roundid:String = "roundId == '"
    let realm: Realm
    realm = try! Realm()
    let data = realm.object(ofType: RoundData.self,forPrimaryKey:getCrtRoundId())
    return data!
}

