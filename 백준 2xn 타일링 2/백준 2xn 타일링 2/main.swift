//
//  main.swift
//  백준 2xn 타일링 2
//
//  Created by 강민성 on 2021/11/27.
//

import Foundation

/*
 
 n = 1 -> 1
 
 0 / 1 / 0
 
 n = 2 -> 3
 
 2 / 0 / 0
 0 / 2 / 0
 
 0 / 0 / 1
 
 n = 3 -> 5
 
 2 / 1 / 0 * 2
 0 / 3 / 0
 0 / 1 / 1 * 2
 
 n = 4 -> 11
 
 2 / 2 / 0 * 3
 4 / 0 / 0
 0 / 4 / 0
 0 / 2 / 1 * 3
 2 / 0 / 1 * 2
 0 / 0 / 2
 
 n = 5 -> 21
 
 2 / 3 / 0 * 4
 4 / 1 / 0 * 3
 0 / 5 / 0
 0 / 3 / 1 * 4
 2 / 1 / 1 * 6
 0 / 1 / 2 * 3
 
 */

let n = Int(readLine()!)!

var dp = Array(repeating: 0, count: 1003)

dp[1] = 1
dp[2] = 3

if n < 3 {
    print(dp[n])
}
else {
    for i in 3...n {
        
        dp[i] = (dp[i-1] + (dp[i-2] * 2)) % 10007
        
    }
    
    print(dp[n] % 10007)
}


