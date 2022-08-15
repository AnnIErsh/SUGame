//
//  SpeedTime.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 14.08.2022.
//

import Foundation

struct SpeedTime {
    var speedScore: Double = 0.0 {
        didSet {
            checkLimits()
        }
    }
    
    var minMove: Double = 3.00 {
        didSet {
            minMove <= 1.00 ? minMove = 1.00 : nil
        }
    }
    
    var maxMove: Double = 6.00 {
        didSet {
            maxMove <= 2.00 ? maxMove = 2.00 : nil
        }
    }
    
    var spawnTime: Double = 1.00 {
        didSet {
            spawnTime <= 0.10 ? spawnTime = 0.10 : nil
        }
    }
    
    var categoryTime: Double = 20.00 {
        didSet {
            categoryTime <= 3 ? categoryTime = 3 : nil
        }
    }
        
    mutating func checkLimits() {
        minMove -= 0.5
        maxMove -= 0.5
        spawnTime -= 0.1
        
        print(minMove)
        print(maxMove)
        print(spawnTime)
    }
}
