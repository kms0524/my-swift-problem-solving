//
//  main.swift
//  백준 부녀회장이 될테야
//
//  Created by 강민성 on 2022/04/11.
//

import Foundation

var map = [[Int]](repeating: [Int](repeating: 1, count: 15), count: 15)
var num = 1
for i in 0..<15 {
    map[0][i] = num
    num += 1
}

for i in 1..<15 {
    for j in 1..<15 {
        map[i][j] = map[i][j-1] + map[i-1][j]
    }
}

var T = Int(readLine()!)!

for _ in 0..<T {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    print(map[k][n-1])
}
