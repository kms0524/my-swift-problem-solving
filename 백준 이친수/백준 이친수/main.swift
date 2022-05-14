//
//  main.swift
//  백준 이친수
//
//  Created by 강민성 on 2021/11/27.
//

import Foundation

/*
 
 N = 1
 
 1
 
 N = 2
 
 10
 
 N = 3
 
 100 101
 
 N = 4
 
 1000 1010 1001
 
 N = 5
 
 10000 10001 10101 10100 10010
 
 N = 6
 
 100000 100001 100010 101010 101000 101001 100101 100100
 
 dp[1][0] = 0
 dp[1][1] = 1
 
 dp[2][0] = 1
 dp[2][1] = 0
 
 dp[3][0] = 1
 dp[3][1] = 1
 
 dp[4][0] = 2
 dp[4][1] = 1
 
 dp[5][0] = 3
 dp[5][1] = 2
 
 dp[6][0] = 5
 dp[6][1] = 3
 */

let N = Int(readLine()!)!


var dp = Array(repeating: Array(repeating: 0, count: 2), count: 91)

dp[1][0] = 0
dp[1][1] = 1

dp[2][0] = 1
dp[2][1] = 0

dp[3][0] = 1
dp[3][1] = 1


if N < 4 {
    print(dp[N].reduce(0){$0 + $1})
}
else {
    for i in 4...N {
        
        dp[i][0] = dp[i-1][0] + dp[i-2][0]
        dp[i][1] = dp[i-1][1] + dp[i-2][1]
        
    }
    print(dp[N].reduce(0){$0 + $1})
}
