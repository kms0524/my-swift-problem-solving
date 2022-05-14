//
//  main.swift
//  백준 체스판 다시 칠하기
//
//  Created by 강민성 on 2022/04/04.
//

import Foundation

var NM = readLine()!.split(separator: " ").map { Int($0)! }
var N = NM[0]
var M = NM[1]



var map = [[String]](repeating: [String](repeating: " ", count: M), count: N)

for i in 0..<N {
    var input = readLine()!.map{ String($0) }
    map[i] = input
}

var minValue = Int.max

for row in 0..<N - 7 {
    for col in 0..<M - 7 {
        
        var count = 0
        
        for j in 0..<8 {
            for i in 0..<8 {
                if i % 2 == 1 {
                    if j % 2 == 1 && map[j + row][i + col] == "B" {
                        count += 1
                    }
                    else if j % 2 == 0 && map[j + row][i + col] == "W" {
                        count += 1
                    }
                }
                else {
                    if j % 2 == 1 && map[j + row][i + col] == "W" {
                        count += 1
                    }
                    else if j % 2 == 0 && map[j + row][i + col] == "B" {
                        count += 1
                    }
                }
            }
        }
        
        count = min(count, 64-count)
        minValue = min(minValue, count)
        
    }
}

print(minValue)
