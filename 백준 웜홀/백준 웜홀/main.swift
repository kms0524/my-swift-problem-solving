//
//  main.swift
//  백준 웜홀
//
//  Created by 강민성 on 2022/05/03.
//

import Foundation

func bellmanFord(_ N: Int, _ edges: [(Int, Int, Int)], _ timeArr: inout [Int]) -> Bool {
    
    for i in 0..<N {
        for j in 0..<edges.count {
            var current = edges[j].0
            var next = edges[j].1
            var time = edges[j].2
            
            if timeArr[next] > timeArr[current] + time {
                timeArr[next] = timeArr[current] + time
                
                if i == N - 1 {
                    return true
                }
            }
        }
    }
    
    return false
}


var TC = Int(readLine()!)!

for _ in 0..<TC {
    let NMW = readLine()!.split(separator: " ").map { Int($0)! }
    let N = NMW[0]
    let M = NMW[1]
    let W = NMW[2]
    
    var edge = [(Int, Int, Int)]()
    var timeArr = [Int](repeating: 1_000_000_000, count: N + 1)
    
    for _ in 0..<M {
        let input = readLine()!.split(separator: " ").map { Int ($0)! }
        edge.append((input[0], input[1], input[2]))
        edge.append((input[1], input[0], input[2]))
    }
    
    for _ in 0..<W {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        edge.append((input[0], input[1], input[2] * -1))
    }
    
    if bellmanFord(N, edge, &timeArr) == true {
        print("YES")
    }
    else {
        print("NO")
    }
}
