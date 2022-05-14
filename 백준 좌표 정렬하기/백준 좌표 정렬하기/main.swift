//
//  main.swift
//  백준 좌표 정렬하기
//
//  Created by 강민성 on 2022/04/18.
//

import Foundation

var N = Int(readLine()!)!
var arr = [(Int, Int)]()
for _ in 0..<N {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((input[0], input[1]))
}

var answer = arr.sorted {
    if $0.0 == $1.0 {
        return $0.1 < $1.1
    }
    return $0.0 < $1.0
}

answer.forEach {
    print("\($0.0) \($0.1)")
}
