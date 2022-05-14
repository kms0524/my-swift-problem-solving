//
//  main.swift
//  백준 연속합
//
//  Created by 강민성 on 2021/11/25.
//

import Foundation

/*
 
 Kadane's Algorithm
 
 max(A[i], A[i] + A[i-1])
 
 */

let n = Int(readLine()!)!

var dp = readLine()!.split(separator: " ").map{ Int(String($0))! }
var answer = 0


for i in 1..<dp.count {
    dp[i] = max(dp[i], dp[i] + dp[i-1])
}

print(dp.sorted(by: >).first!)
