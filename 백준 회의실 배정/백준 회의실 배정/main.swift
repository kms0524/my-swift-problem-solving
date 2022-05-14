//
//  main.swift
//  백준 회의실 배정
//
//  Created by 강민성 on 2022/05/07.
//

import Foundation

var N = Int(readLine()!)!

var arr = [(Int, Int)]()
var count = 0

for i in 0..<N {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((input[0], input[1]))
}

var sorted = arr.sorted {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    }
    return $0.1 < $1.1
}

var current = -1

for i in 0..<sorted.count {
    if sorted[i].0 >= current {
        current = sorted[i].1
        count += 1
    }
}

print(count)
