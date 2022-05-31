//
//  main.swift
//  백준 평범한 배낭
//
//  Created by 강민성 on 2021/12/10.
//

import Foundation

var NK = readLine()!.split(separator: " ").map { Int($0)! }

var N = NK[0]
var K = NK[1]

var weights = [Int](repeating: 0, count: K + 1)
var values = [Int](repeating: 0, count: K + 1)

for i in 1...N {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    weights[i] = input[0]
    values[i] = input[1]
}

func knapsack(_ stuffCount: Int, _ bagWeight: Int, _ weights: [Int], _ values: [Int]) -> Int {
    
    var dp = [Int](repeating: 0, count: bagWeight + 1)
    
    for i in 1...stuffCount {
        for j in stride(from: bagWeight, to: 0, by: -1) {
            if weights[i] <= j {
                dp[j] = max(dp[j], dp[j - weights[i]] + values[i])
            }
        }
    }
    
    var maxValue = dp[bagWeight]
    
    return maxValue
}

print(knapsack(N, K, weights, values))
