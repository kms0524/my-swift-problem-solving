//
//  main.swift
//  백준 계단 오르기
//
//  Created by 강민성 on 2021/11/24.
//

import Foundation

/*

 4개 [0, 10, 20, 30]
 
 sum = 0 + 10 + 30
 sum = 0 + 20 + 30
 
 */

let stairCount = Int(readLine()!)!
var stairs: [Int] = Array(repeating: 0, count: stairCount)
var dp: [Int] = Array(repeating: 0, count: stairCount)

for i in 0..<stairCount {
    let point = Int(readLine()!)!
    stairs[i] = point
}

if stairCount == 1 {
    print(stairs[0])
}
else if stairCount == 2 {
    print(stairs[0] + stairs[1])
}
else if stairCount == 3 {
    print(max(stairs[0] + stairs[2], stairs[1] + stairs[2]))
}
else {
    
    dp[0] = stairs[0]
    dp[1] = max(stairs[1], stairs[0] + stairs[1])
    dp[2] = max(stairs[2] + stairs[0], stairs[1] + stairs[2])
    
    for i in 3..<stairCount{
        dp[i] = max(stairs[i] + dp[i-2], stairs[i] + stairs[i-1] + dp[i-3])
    }
    print(dp[stairCount - 1])
    
}

/*
 
 10 -> 20 -> 25 -> 20
 
 */
