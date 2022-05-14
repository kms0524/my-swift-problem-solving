//
//  main.swift
//  백준 벽 부수고 이동하기
//
//  Created by 강민성 on 2022/05/05.
//

import Foundation

struct Queue<T> {
    var nodes: [T] = []
    var idx = 0
    
    var isEmpty: Bool {
        return !(nodes.count > idx)
    }
    
    mutating func enqueue(_ element: T) {
        nodes.append(element)
    }
    
    mutating func dequeue() -> T {
        defer {
            idx += 1
        }
        return nodes[idx]
    }
    
    var count: Int {
        return nodes.count
    }
}


func bfs() -> Int {
    
    var queue = Queue<(Int, Int, Int)>()
    
    var dx = [1, -1, 0, 0]
    var dy = [0, 0, 1, -1]
    
    
    var visited = Array(repeating: Array(repeating: [0,0], count: M), count: N)
    visited[0][0][0] = 1
    
    queue.enqueue((0, 0, 0))
    
    while !queue.isEmpty {
        var current = queue.dequeue()
        
        if current.0 == N - 1 && current.1 == M - 1 {
            return visited[current.0][current.1][current.2]
        }
        
        for i in 0..<4 {
            var xx = current.0 + dx[i]
            var yy = current.1 + dy[i]
            
            
            if (0..<N).contains(xx) && (0..<M).contains(yy) {
                if map[xx][yy] == 1 && current.2 == 0 {
                    visited[xx][yy][1] = visited[current.0][current.1][current.2] + 1
                    queue.enqueue((xx, yy, 1))
                }
                else if map[xx][yy] == 0 && visited[xx][yy][current.2] == 0 {
                    visited[xx][yy][current.2] = visited[current.0][current.1][current.2] + 1
                    queue.enqueue((xx, yy, current.2))
                }
            }
        }
    }
    
    return -1
}

var NM = readLine()!.split(separator: " ").map { Int($0)! }

var N = NM[0]
var M = NM[1]
var map = [[Int]]()

for i in 0..<N {
    var input = Array(readLine()!.map { Int(String($0))! })
    map.append(input)
}


print(bfs())
