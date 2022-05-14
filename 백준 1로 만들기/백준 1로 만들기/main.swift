//
//  main.swift
//  백준 1로 만들기
//
//  Created by 강민성 on 2021/11/23.
//

import Foundation


/*
 
 dp[2] = 2 / 2 = 1
 dp[3] = 3 / 3 = 1
 dp[4] = 4 / 2 -> 2 = 2
 dp[5] = 5 - 1 -> 4 = 3
 dp[6] = 6 / 3 -> 2 = 2
 dp[7] = 7 - 1 -> 6 = 3
 dp[8] = 8 / 2 -> 4 = 3
 dp[9] = 9 / 3 -> 3 = 2
 
 */

let N = Int(readLine()!)!

if N == 1 {
    print(0)
}
else if N == 2 || N == 3 {
    print(1)
}
else{
    var dp: [Int] = Array(repeating: 0, count: 2000002)

    dp[1] = 0
    dp[2] = 1
    dp[3] = 1

    for i in 4...N {
        if i % 6 == 0 {
            dp[i] = min(dp[i/3] + 1, dp[i/2] + 1, dp[i-1] + 1)
        }
        else if i % 3 == 0 {
            dp[i] = min(dp[i-1] + 1, dp[i/3] + 1)
        }
        else if i % 2 == 0 {
            dp[i] = min(dp[i/2] + 1, dp[i-1] + 1)
        }
        else {
            dp[i] = dp[i-1] + 1
        }
    }
    print(dp[N])
}

