//
//  main.swift
//  프로그래머스 무지의 먹방 라이브_2
//
//  Created by 강민성 on 2021/09/06.
//

import Foundation

func solution(_ food_times:[Int], _ K:Int64) -> Int {
    
    guard food_times.reduce(0, +) > K else {
        return -1
    }
    
    var k = Int(K)
    
    var food: [(time: Int, index: Int)] = food_times.enumerated().map{ ($1, $0) }
    
    food.sort { $0.0 < $1.0 }
    
    var i = 0
    var j = 0
    var cycle = 0
    
    while i < food.count {
        j = i
        let minTime = food[i].time
        while j < food.count && minTime == food[j].time {
            j += 1
        }
        
        let currentMinTime = minTime - cycle
        let timeCount = (food.count - i) * currentMinTime
        
        if timeCount > k {
            break
        }
        
        k -= timeCount
        cycle += currentMinTime
        i = j
    }
    
    food = food[i..<food.endIndex].sorted { $0.index < $1.index }
    
    k %= food.count
    
    
    return food[k].index + 1
}

print(solution([3, 1, 2], 5))
