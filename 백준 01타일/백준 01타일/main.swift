//
//  main.swift
//  백준 01타일
//
//  Created by 강민성 on 2022/05/30.
//

import Foundation

var N = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 1_000_001)

dp[0] = 1
dp[1] = 1

if N == 1 {
    print(1)
}
else {
    
    for i in 2...N {
        dp[i] = (dp[i-1] + dp[i-2]) % 15746
    }
    
    print(dp[N])
}
