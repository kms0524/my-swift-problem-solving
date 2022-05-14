//
//  main.swift
//  백준 설탕 배달
//
//  Created by 강민성 on 2021/11/23.
//

import Foundation

/*
 
 3 = 3(1)
 5 = 5(1)
 6 = 3(2)
 8 = 3(1) + 5(1)
 9 = 3(3)
 10 = 5(2)
 11 = 3(2) + 5(1)
 12 = 3(4)
 13 =
 14 = 3(3) + 5(1)
 
 
 */

let N = Int(readLine()!)!

var dp: [Int] = Array(repeating: 0, count: 5005)

dp[3] = 1
dp[5] = 1

if N == 4 {
    print(-1)
}
else if N == 3 || N == 5 {
    print(1)
}
else {
    for i in 6...N {
        if i % 5 == 0 {
            dp[i] = dp[i-5] + 1
        }
        else if i % 3 == 0 {
            dp[i] = dp[i-3] + 1
        }
        else {
            if dp[i-3] != 0 && dp[i-5] != 0 {
                dp[i] = min(dp[i-3], dp[i-5]) + 1
            }
        }
    }
    print(dp[N] == 0 ? -1 : dp[N])
}
