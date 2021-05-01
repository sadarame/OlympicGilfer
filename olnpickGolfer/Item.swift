//
//  Item.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/04/26.
//

import Foundation
import RealmSwift

struct Item: Identifiable {
    
    let id = UUID()
    let roundId:String
    let roundDate:Date
    let peoples:Int
    let memo:String
    let rate:Int
    let playerScoreList:List<PlayerScore>
}

extension Item {
  init(roundData: RoundData) {
    roundId = roundData.roundId
    roundDate = roundData.roundDate
    peoples = roundData.peoples
    memo = roundData.memo
    rate = roundData.rate
    playerScoreList = roundData.playerScoreList
  }
}
