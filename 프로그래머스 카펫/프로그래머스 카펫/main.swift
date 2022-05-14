//
//  main.swift
//  프로그래머스 카펫
//
//  Created by 강민성 on 2021/11/05.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    let arr = divisor(n: brown + yellow)
    var answer: [Int] = []
    
    
    if arr.count % 2 == 1 {
        let middle = arr[arr.index(before: arr.endIndex) - arr.count / 2]
        answer.append(middle)
        answer.append(middle)
    }
    else {
        
        var left: Int = 0
        var right: Int = 0
        var idx = 0
        
        let reversed:[Int] = arr.reversed()
        
        while ((left - 2) * (right - 2) != yellow) {
            left = reversed[reversed.index(before: reversed.endIndex) - reversed.count / 2 - idx]
            right = arr[arr.index(before: arr.endIndex) - arr.count / 2 - idx]
            idx += 1
        }
        
        answer.append(left)
        answer.append(right)
        
    }
//
//    print(arr)
//    print(answer)
    return answer
}

func divisor(n : Int) -> [Int] {
    
    var arr: [Int] = []
    
    for i in 1...n {
        if n % i == 0 {
            arr.append(i)
        }
    }
    
    return arr
    
}

solution(18, 6)


/*
 
 BBBBBBBB
 BRRRRRRB
 BBBBBBBB
 
 24 -> 1 2 3 4 6 8 12 24
 
 정답 : 8 3
 
 
 BBBBBB
 BBRRBB
 BBRRBB
 BBBBBB
 
 
 */
