//
//  main.swift
//  백준 알고스팟
//
//  Created by 강민성 on 2021/08/04.
//

/// 다익스트라 라기보단 완전탐색 인듯
import Foundation

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

var input = readLine()!.split(separator: " ").map { Int($0)! }

var M = input[0]
var N = input[1]

var array = Array(repeating: [Int](), count: N)

for i in 0..<N {
    let mapInput = readLine()!.map{ Int(String($0))! }
    array[i] = mapInput
}

var queue = [(Int, Int, Int)]()
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

queue.insert((0, 0, 0), at: 0)

visited[0][0] = true

while !queue.isEmpty {
    
    let x = queue.first!.0
    let y = queue.first!.1
    let count = queue.first!.2
    
    queue.removeFirst()
    
    if x == M - 1 && y == N - 1 {
        print(count)
        break
    }
    
    for i in 0..<dx.count {
        
        let xx = x + dx[i]
        let yy = y + dy[i]
        
        if xx < 0 || xx >= M || yy < 0 || yy >= N {
            continue
        }
        
        if visited[xx][yy] == true {
            continue
        }
        
        if array[xx][yy] == 0 {
            queue.insert((xx, yy, count), at: 0)
        }
        else {
            queue.append((xx, yy, count + 1))
        }
        visited[xx][yy] = true
    }
}
