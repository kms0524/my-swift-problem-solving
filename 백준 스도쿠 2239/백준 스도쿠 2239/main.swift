//
//  main.swift
//  백준 스도쿠 2239
//
//  Created by 강민성 on 2022/05/24.
//

import Foundation

var map = [[Int]]()

for i in 0..<9 {
    map.append(readLine()!.map { Int(String($0))! })
}

func solution(_ map: inout [[Int]]) -> Bool {
    for i in 0..<9 {
        for j in 0..<9 where map[i][j] == 0{
            for k in 1...9 where isValid(map, k, i, j) {
                map[i][j] = k
                if solution(&map) {
                    return true
                }
                else {
                    map[i][j] = 0
                }
            }
            return false
        }
    }
    return true
}

func isValid(_ map: [[Int]], _ num : Int, _ row: Int, _ col: Int) -> Bool {
    
    for i in 0..<9 {
        if map[row][i] == num || map[i][col] == num {
            return false
        }
        if map[(row / 3) * 3 + i / 3][(col / 3) * 3 + i % 3] == num {
            return false
        }
    }
    
    return true
}

solution(&map)

for i in 0..<9 {
    var answer = ""
    for j in 0..<9 {
        answer += String(map[i][j])
    }
    print(answer)
}
