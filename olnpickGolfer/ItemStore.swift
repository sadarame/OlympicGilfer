//
//  ItemStore.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/04/26.
//

import Foundation
import RealmSwift

final class ItemStore: ObservableObject {

    var currentRoundData:RoundData?
    private var realm:Realm
    
    // itemResultsにDBのデータをセット
    init(realm:Realm) {
        self.realm = realm
        let roundId = getCrtRoundId()
        if roundId != "" {
            self.currentRoundData = realm.object(ofType: RoundData.self, forPrimaryKey: roundId)
        }
    }
    
    func setRoundData(roundData:RoundData){
            self.currentRoundData = roundData
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
    
    //　スコア増減
    func scoreChange(playerScore:PlayerScore,type:Int){
        objectWillChange.send()
        //マイナスの場合、０以下にならないように制御
        //データベース更新
        do {
            let realm = try Realm()
            try realm.write {
                
                switch type {
                case Const.plus:
                    playerScore.olynpicScore  += 1
                case Const.minus:
                    if playerScore.olynpicScore > 0 {
                        playerScore.olynpicScore -= 1
                    }
                default: break
                }
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
    func delete(itemID: Int) {
        objectWillChange.send()
        
        //    guard let itemDB = itemResults.first(where: { $0.id == itemID})
        //    else {
        //      return
        //    }
        
        do {
            let realm = try Realm()
            try realm.write {
                //        realm.delete(itemDB)
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
