//
//  main.swift
//  백준 덩치
//
//  Created by 강민성 on 2022/04/14.
//

import Foundation

var N = Int(readLine()!)!
var arr = [[Int]]()
for i in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
    
}

for i in 0..<N {
    var score = 1
    for j in 0..<N {
        if arr[i][0] < arr[j][0] && arr[i][1] < arr[j][1] {
            score += 1
        }
    }
    print(score, terminator: " ")
}
