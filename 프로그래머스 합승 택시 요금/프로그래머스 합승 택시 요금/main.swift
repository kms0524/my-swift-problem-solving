//
//  main.swift
//  프로그래머스 합승 택시 요금
//
//  Created by 강민성 on 2021/08/14.
//

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    
    let INF = 999999
    
    var cost: [[Int]] = Array(repeating: Array(repeating: INF, count: n + 1), count: n + 1)
    
    for i in 0...n {
        cost[i][i] = 0
    }
    
    for i in fares {
        cost[i[0]][i[1]] = i[2]
        cost[i[1]][i[0]] = i[2]
    }
    
    for mid in 1...n {
        for s in 1...n {
            if s == mid {
                continue
            }
            for end in 1...n {
                if cost[s][end] > cost[s][mid] + cost[mid][end] {
                    cost[s][end] = cost[s][mid] + cost[mid][end]
                }
            }
        }
    }
    
    
    
    var answer = cost[s][a] + cost[s][b]
    
    
    for i in 1...n {
        answer = min(answer, cost[s][i] + cost[i][a] + cost[i][b])
    }
    
    return answer
}

