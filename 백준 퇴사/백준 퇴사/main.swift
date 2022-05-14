//
//  main.swift
//  백준 퇴사
//
//  Created by 강민성 on 2021/11/28.
//

import Foundation

/*
 
 3    2 1 1 1 1
 1000 5 2 3 2 10
 
 1. 이전까지 일을 안한 경우
 
 2. 이전에 일을 한 후 다시 시작하는 경우
 
 */

let N = Int(readLine()!)!

var Ti = Array(repeating: 0, count: N + 1)
var Pi = Array(repeating: 0, count: N + 1)

var dp = Array(repeating: 0, count: N + 1)
var answer = 0

for i in 0..<N {
    
    var input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    Ti[i] = input[0]
    Pi[i] = input[1]
}

for i in 0..<N + 1{
    for j in 0..<i {
        dp[i] = max(dp[i], dp[j])
        print("일 처음 시작 : \(dp)")
        
        if Ti[j] + j == i {
            dp[i] = max(dp[i], dp[j] + Pi[j])
            print("일 끝내고 시작: \(dp)")
        }
    }
    print("=================================")
    answer = max(answer, dp[i])
}

print(answer)

//print(dp)
//print(Ti)
//print(Pi)
