//
//  main.swift
//  백준 외판원 순회
//
//  Created by 강민성 on 2022/05/22.
//

import Foundation

var N = Int(readLine()!)!

var INF = 1_000_000_000

var map = [[Int]]()
var dp = [[Int]](repeating: [Int](repeating: -1, count: 1 << N), count: N)

for i in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}


func tsp(_ node: Int, _ visited: Int) -> Int {
    if visited == (1 << N) - 1 {
        if map[node][0] == 0 {
            return INF
        }
        else {
            return map[node][0]
        }
    }
    
    if dp[node][visited] != -1 {
        return dp[node][visited]
    }
    
    var answer = INF
    
    for i in 0..<N {
        
        if map[node][i] == 0 || (visited & (1 << i)) != 0 {
            continue
        }
        
        answer = min(answer, map[node][i] + tsp(i, visited | ( 1 << i )))
    }
    
    dp[node][visited] = answer
    
    return answer
}

print(tsp(0, 1 << 0))

