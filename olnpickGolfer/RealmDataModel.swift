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

struct RoundDataStruct: Hashable  {
    let roundId:String
    let roundDate:Date
    let peoples:Int
    let memo:String
    let rate:Int
    let playerScoreList:List<PlayerScore>
}

extension RoundDataStruct{
    init(itemDB: RoundData) {
        roundId = itemDB.roundId
        roundDate = itemDB.roundDate
        peoples = itemDB.peoples
        memo = itemDB.memo
        rate = itemDB.rate
        playerScoreList = itemDB.playerScoreList
    }
}
