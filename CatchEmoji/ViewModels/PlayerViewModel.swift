//
//  PlayerViewModel.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 13.08.2022.
//

import Foundation
import SwiftUI
import Data

final class PlayerViewModel: ObservableObject {
    @Published var results: [PlayerResult]?
    var currentResult: PlayerResult?
    @Injected var data: DataService?
    
    func addScoreToData(newData: [PlayerResult]?) {
        let entities = Score(context: (data?.context)!)
        entities.score = data?.encodeData(type: [PlayerResult].self, withData: newData)
        data?.saveData()
        print("Score added", newData as Any)
    }
    
    func getScoreFromData() {
        let requests = Score.fetchRequest()
        var mapped: [PlayerResult]?
        do {
            let emjs = try data?.context?.fetch(requests) ?? []
            for i in emjs {
                let dec = data?.decodeData(type: [PlayerResult].self, withData: i.score)
                mapped = dec
                print("decode Score from core data")
            }
        }
        catch {
            print("error getting Score")
        }
        data?.saveData()
        self.results = mapped
    }
}
