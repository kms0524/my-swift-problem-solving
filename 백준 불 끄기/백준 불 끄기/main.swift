//
//  main.swift
//  백준 불 끄기
//
//  Created by 강민성 on 2022/07/12.
//

import Foundation

var map = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 10)

var dx = [1, -1, 0, 0, 0]
var dy = [0, 0, 0, 1, -1]

var answer = Int.max
var tempMap = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 10)

func toggleSwitch(_ x: Int, _ y: Int) {
    for i in 0..<5 {
        var xx = x + dx[i]
        var yy = y + dy[i]
        
        if (xx < 0 || yy < 0 || xx >= 10 || yy >= 10) {
            continue
        }
        tempMap[xx][yy] ^= 1
    }
}


for i in 0..<10 {
    var input = readLine()!.map { String($0) }
    for j in 0..<10 {
        if input[j] == "#" {
            map[i][j] = 0
        }
        else {
            map[i][j] = 1
        }
    }
}




for i in 0..<1024 {
    
    for idx in 0..<10 {
        tempMap[idx] = map[idx]
    }
    
    var temp = 0
    
    for j in 1...10 {
        var num = 1024
        num = num >> j
        
        if (i & num) > 0 {
            temp += 1
            toggleSwitch(0, j - 1)
        }
    }
    
    for j in 1..<10 {
        for k in 0..<10 {
            if tempMap[j - 1][k] == 1 {
                temp += 1
                toggleSwitch(j, k)
            }
        }
    }
    
    if !tempMap[9].contains(1) {
        answer = min(answer, temp)
    }
}

print(answer == Int.max ? "-1" : answer)
