//
//  main.swift
//  백준 파도반 수열
//
//  Created by 강민성 on 2021/11/27.
//

import Foundation

/*
 
 
 1 / 1
 2 / 1
 3 / 1
 4 / 2 + 8 / 5 -> 9 / 7
 5 / 2 + 9 / 7 -> 10 / 9
 6 / 3 + 10 / 9 -> 11 / 12
 7 / 4 + 11 / 12 -> 12 / 16
 8 / 5 + 12 / 16  -> 13 / 21
 9 / 7 + 13 / 21 -> 14 / 28
 10 / 9
 11 / 12
 12 / 16
 13 / 21
 14 / 28
 15 / 37
 
 */

let T = Int(readLine()!)!

var dp: [Int64] = Array(repeating: 0, count: 103)

dp[1] = 1
dp[2] = 1
dp[3] = 1
dp[4] = 2


for _ in 0..<T {
    
    var N = Int(readLine()!)!
    
    if N < 5 {
        print(dp[N])
    }
    else {
        
        for i in 5...N {
            dp[i] = Int64(dp[i-5] + dp[i-1])
        }
        print(Int64(dp[N]))
    }
}
