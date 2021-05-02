//
//  ItemStore.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/04/26.
//

import Foundation
import RealmSwift
import SwiftUI

final class ItemStore: ObservableObject {
    
    var currentRoundData:RoundData?
    private var realm:Realm
    var itemResults: Results<RoundData>
    
    // itemResultsにDBのデータをセット
    init(realm:Realm) {
        self.realm = realm
        let roundId = getCrtRoundId()
        if roundId != "" {
            self.currentRoundData = realm.object(ofType: RoundData.self, forPrimaryKey: roundId)
        }
        itemResults = realm.objects(RoundData.self)
    }
    
    var items: [Item] {
      itemResults.map(Item.init)
    }
    
    func setRoundData(roundData:RoundData){
        self.currentRoundData = roundData
    }
    
    func historyToScoreBoard(roundid : String){
        self.currentRoundData = realm.object(ofType: RoundData.self, forPrimaryKey: roundid)
    }
    
    func getTotalBudget() -> Int {
        var totalAmountMoney = 0
        for roundData in itemResults {
            totalAmountMoney = totalAmountMoney + roundData.playerScoreList[0].olynpicAmount
        }
        
        return totalAmountMoney
    }

}

extension ItemStore {
    // データを追加
    func create(roundData:RoundData) {
        // スコア記録開始の導線
        setRoundData(roundData: roundData)
        // これを書かないとDBの変更をViewに伝えることができません。
        objectWillChange.send()
        
        do {
            try realm.write {
                realm.add(roundData)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getAmountMoney(point:Int) -> Int {
        
        var sumPoint:Int = 0
        for i in currentRoundData!.playerScoreList {
            sumPoint = sumPoint + i.olynpicScore
        }
        let amountOfMoney = (point * currentRoundData!.peoples - sumPoint) * currentRoundData!.rate
        return amountOfMoney
        
        
    }
    
    //　スコア増減
    func scoreChange(playerScore:PlayerScore,type:Int){
        objectWillChange.send()
        //マイナスの場合、０以下にならないように制御
        //データベース更新
        do {
            let realm = try Realm()
            try realm.write {
                //スコア
                switch type {
                case Const.plus:
                    playerScore.olynpicScore  += 1
                case Const.minus:
                    if playerScore.olynpicScore > 0 {
                        playerScore.olynpicScore -= 1
                    }
                default: break
                }
                //金額
                playerScore.olynpicAmount = getAmountMoney(point: playerScore.olynpicScore)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    //　スコア増減
    func scoreChange(playerScore:PlayerScore,amount:Int){
        objectWillChange.send()
        //データベース更新
        do {
            let realm = try Realm()
            try realm.write {
                playerScore.olynpicScore  += amount
                playerScore.olynpicAmount = getAmountMoney(point: playerScore.olynpicScore)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func rateChange(rate:Int){
        objectWillChange.send()
        do {
            let realm = try Realm()
            try realm.write {
                currentRoundData?.rate = rate
                for playerScore in currentRoundData!.playerScoreList {
                    playerScore.olynpicAmount = getAmountMoney(point: playerScore.olynpicScore)
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // データを更新
    func update(playerScore: PlayerScore) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(PlayerScore.self,
                             value: playerScore.olynpicScore + 1,
                             update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // データを削除
    func delete(roundId: String) {
        objectWillChange.send()
        
        guard let roundData = realm.object(ofType: RoundData.self, forPrimaryKey: roundId) else { return }
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(roundData)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // データを全削除
    func deleteAll() {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
