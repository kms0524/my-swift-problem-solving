//
//  main.swift
//  백준 정수 삼각형
//
//  Created by 강민성 on 2021/11/25.
//

import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []
var dp: [[Int]] = []

for i in 0..<n {
    
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    dp.append(Array(repeating: 0, count: i + 1))
    arr.append(input)
    
}

if n == 1 {
    print(arr[0][0])
}
else {
    
    dp[0][0] = arr[0][0]
    dp[1][0] = arr[0][0] + arr[1][0]
    dp[1][1] = arr[0][0] + arr[1][1]
    
    for i in 2..<arr.count {
        
        let idx = dp[i].count - 1
        dp[i][0] = arr[i][0] + dp[i-1][0]
        dp[i][idx] = arr[i][idx] + dp[i-1][idx - 1]
        
        
        for j in 1..<arr[i].count - 1 {
            dp[i][j] = max(arr[i][j] + dp[i-1][j - 1], arr[i][j] + dp[i-1][j])
        }
        
    }
    
    print(dp[n-1].sorted(by: >).first!)
    
}


/*
 
 1
 1 2
 1 2 3
 1 2 3 4
 
 
 1
 2 3
 3 5 6
 4 7 9 10
 
 
 
 */
