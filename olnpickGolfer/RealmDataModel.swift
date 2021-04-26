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
    @objc dynamic var rate:Int = 0
    
    let playerlScoreList = List<PlayerlScore>()
    
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
    @objc dynamic var roundDate = Date()
    
}


func getRoundData() -> RoundData {
    
//    let roundid:String = "roundId == '"
    let realm: Realm
    realm = try! Realm()
//    let data = realm.objects(RoundData.self).filter(roundid + getCrtRoundId() + "'")
    let data = realm.object(ofType: RoundData.self,forPrimaryKey:getCrtRoundId())
    //    print(data[0].roundId)
    return data!
}

struct RoundDataStruct: Hashable  {
    var roundId:String
    var roundDate:Date
    var peoples:Int
    var memo:String
    var rate:Int
    let playerlScoreList:List<PlayerlScore>
}

extension RoundDataStruct{
    init(itemDB: RoundData) {
        roundId = itemDB.roundId
        roundDate = itemDB.roundDate
        peoples = itemDB.peoples
        memo = itemDB.memo
        rate = itemDB.rate
        playerlScoreList = itemDB.playerlScoreList
    }
}
