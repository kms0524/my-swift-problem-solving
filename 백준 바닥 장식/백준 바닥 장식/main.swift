//
//  main.swift
//  백준 바닥 장식
//
//  Created by 강민성 on 2021/07/22.
//

import Foundation

var readline = readLine()!.split(separator: " ").map{ Int($0)! }

var N = readline[0]
var M = readline[1]
var answer = 0

var map = [[Character]](repeating: [Character](), count: N)

for i in 0..<N {
    map[i] = Array(readLine()!)
}

for i in map.indices {
    for j in map[i].indices {
        if map[i][j] == "-" {
            if j > 0 && map[i][j] != map[i][j-1] {
                answer += 1
            }
            else if j == 0 {
                answer += 1
            }
        }
        else {
            if i > 0 && map[i][j] != map[i-1][j] {
                answer += 1
            }
            else if i == 0 {
                answer += 1
            }
        }
    }
}

print(answer)
