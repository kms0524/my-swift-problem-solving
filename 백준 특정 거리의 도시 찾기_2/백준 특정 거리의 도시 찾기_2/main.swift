//
//  main.swift
//  백준 특정 거리의 도시 찾기_2
//
//  Created by 강민성 on 2021/08/12.
//

import Foundation

var firstInput = readLine()!.split(separator: " ").map{ Int(String($0))! }

let N = firstInput[0]
let M = firstInput[1]
let K = firstInput[2]
let X = firstInput[3]

var INF = Int.max

var dist = Array(repeating: INF, count: N + 1)
var map = [[Int]](repeating: [Int](), count: N + 1)
var visited = [Bool](repeating: false, count: N + 1)
var answer: [Int] = []

for _ in 0..<M {
    
    let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    map[line[0]].append(line[1])
}

var queue = [(Int, Int)]()

dist[X] = 0
queue.append((X, 0))

while !queue.isEmpty {
    
    let (nowNode, nowCost) = queue.removeFirst()
    
    visited[nowNode] = true
    
    if dist[nowNode] < nowCost || nowCost >= K {
        continue
    }
    
    for next in map[nowNode] {
        if nowCost + 1 < dist[next] {
            dist[next] = nowCost + 1
            
            if !visited[next] {
                queue.append((next, nowCost + 1))
                if nowCost + 1 == K {
                    answer.append(next)
                }
                
            }
        }
    }
}

answer.sort()

if !answer.isEmpty {
    for i in answer {
        print(i)
    }
}
else {
    print(-1)
}
