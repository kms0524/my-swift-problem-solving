//
//  main.swift
//  백준 포도주 시식
//
//  Created by 강민성 on 2021/11/25.
//

import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: n)
var dp = Array(repeating: 0, count: n)

for i in 0..<n {
    let wine = Int(readLine()!)!
    arr[i] = wine
}

if n == 1 {
    print(arr[0])
}
else if n == 2 {
    print(arr[0] + arr[1])
}
else if n == 3 {
    print(max(max(arr[0] + arr[1], arr[0] + arr[2]), arr[1] + arr[2]))
}
else {
    
    dp[0] = arr[0]
    dp[1] = max(arr[1], arr[0] + arr[1])
    dp[2] = max(max(arr[0] + arr[1], arr[0] + arr[2]), arr[1] + arr[2])
    
    for i in 3..<n {
        dp[i] = max(max(arr[i] + dp[i-2], dp[i-1]), arr[i] + arr[i-1] + dp[i-3])
        print(dp)
    }
    
    print(dp[n - 1])
}
