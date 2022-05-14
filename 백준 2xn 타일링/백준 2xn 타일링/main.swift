//
//  main.swift
//  백준 2xn 타일링
//
//  Created by 강민성 on 2021/11/24.
//

import Foundation

let n = Int(readLine()!)!

/*
 
 2x1 = |
 
 1
 
 2x2 = || / =
 
 2
 
 2x3 = ||| / =| / |=
 
 3
 
 2x4 = |||| / =|| / |=| / ||= / ==
 
 5
 
 2x5 = ||||| / =||| / |=||/ ||=| / ==| / |||= / =|= / |==
 
 8
 
 ...
 
 피보니치
 
 
 */
if n == 1 {
    print(1)
}
else if n == 2 {
    print(2)
}
else {
    var dp: [Int] = Array(repeating: 0, count: 1003)
    
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
        dp[i] = (dp[i-2] + dp[i-1]) % 10007
    }
    print(dp[n])
}


