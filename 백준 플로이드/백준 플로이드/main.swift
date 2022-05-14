//
//  main.swift
//  백준 플로이드
//
//  Created by 강민성 on 2021/08/15.
//

import Foundation

var n = Int(readLine()!)!
var m = Int(readLine()!)!

var INF = 987654321

var map: [[Int]] = Array(repeating: [Int](repeating: INF, count: n), count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    
    let start = input[0] - 1
    let end = input[1] - 1
    let cost = input[2]
    
    map[start][end] = min(map[start][end], cost)
}

for i in 0..<n {
    map[i][i] = 0
}


for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if i == j {
                continue
            }
            map[i][j] = min(map[i][k] + map[k][j], map[i][j])
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if map[i][j] == INF {
            map[i][j] = 0
        }
    }
}

var answer = ""

for i in map.indices {
    var answer = ""
    map[i].forEach {
        answer += "\($0) "
    }
    answer.removeLast()
    print(answer)
}
