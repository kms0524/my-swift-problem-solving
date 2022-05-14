//
//  main.swift
//  프로그래머스 조이스틱
//
//  Created by 강민성 on 2021/11/11.
//

import Foundation

func solution(_ name:String) -> Int {
    
    var count = 0
    var moveCount = name.count - 1
    
    var nameArr = name.map{ $0 }
    
    nameArr.forEach { char in
        if char != "A" {
            var up = char.asciiValue! - 65
            var down = 91 - char.asciiValue!
            count += Int((up < down) ? up : down)
        }
    }
    
    for i in 0..<name.count {
        
        if nameArr[i] != "A" {
            var next = i + 1
            while next < nameArr.count && nameArr[next] == "A" {
                next += 1
            }
            var move = 2 * i + nameArr.count - next
            moveCount = min(moveCount, move)
            
        }
        
    }
    
    count += moveCount
    print(count)
    return count
}

solution("ABABAAAAAAABA")
