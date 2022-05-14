//
//  main.swift
//  프로그래머스 위장
//
//  Created by 강민성 on 2021/11/15.
//

import Foundation


func solution(_ clothes:[[String]]) -> Int {
    
    var dic: [String: [String]] = [:]
    
    for cloth in clothes {
        if dic[cloth[1]] != nil {
            dic[cloth[1]]!.append(cloth[0])
        }
        else {
            dic[cloth[1]] = [cloth[0]]
        }
    }
    
    let valuesCount = dic.mapValues{ $0.count }.values
    
    var answer = valuesCount.reduce(1) {
        $0 * ($1 + 1)
    }
    
    answer -= 1
    
    /*
     
     1 2
     
     1 2 3 4
     
     1 2 3
     
     */
    
    return answer
}

solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]])
