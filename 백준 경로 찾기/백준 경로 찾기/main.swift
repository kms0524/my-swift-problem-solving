//
//  main.swift
//  백준 경로 찾기
//
//  Created by 강민성 on 2021/08/15.
//

import Foundation

var N = Int(readLine()!)!

var map = [[Int]](repeating: [Int](), count: N)

for i in 0..<N {
    map[i] = Array(readLine()!.split(separator: " ").map{ Int($0)! })
}

for k in 0..<N {
    for i in 0..<N {
        for j in 0..<N {
            if map[i][k] == 1 && map[k][j] == 1 {
                map[i][j] = 1
            }
        }
    }
}


for i in 0..<N {
    var answer: String = ""
    for j in 0..<N {
        if j != N - 1 {
            answer += String(map[i][j]) + " "
        }
        else {
            answer += String(map[i][j])
        }
    }
    print(answer)
}


