//
//  main.swift
//  백준 바이러스
//
//  Created by 강민성 on 2021/07/18.
//

import Foundation

var N = Int(readLine()!)!
var M = Int(readLine()!)!
var count = 0

var map: [[Int]] = Array(repeating: Array(repeating: 0, count: 0), count: N + 1)


func DFS(start: Int) {
    
    var visited = [Int]()
    var stack = [start]
    
    while !stack.isEmpty {
        let node = stack.popLast()!
        
        if !visited.contains(node) {
            
            visited.append(node)
            count += 1
            stack.append(contentsOf: map[node])
        }
    }
}

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    
    let start = input[0]
    let end  = input[1]
    
    map[start].append(end)
    map[end].append(start)
}

DFS(start: 1)
print(count - 1)
