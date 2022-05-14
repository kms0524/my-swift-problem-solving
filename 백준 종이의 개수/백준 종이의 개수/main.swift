//
//  main.swift
//  백준 종이의 개수
//
//  Created by 강민성 on 2022/04/24.
//

import Foundation

func check(_ arr: [[Int]]) -> Bool {
    
    if Set(arr.flatMap{ $0 }).count != 1 {
        return false
    }
    return true
}

func divide(_ row: Int, _ col: Int, size: inout Int) {
    if check(map) {
        
    }
    else {
        size = N / 3
        
        for i in 0..<3 {
            for j in 0..<3 {
                divide(row + size * i , col + size * j, size: &size)
            }
        }
    }
}


var N = Int(readLine()!)!

var map = [[Int]]()
var answer = [0, 0, 0]
for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

divide(0, 0, size: &N)
