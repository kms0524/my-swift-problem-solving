//
//  main.swift
//  백준 ATM
//
//  Created by 강민성 on 2022/05/07.
//

import Foundation

var N = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map { Int($0)! }
var answer = 0
arr.sort {
    $0 > $1
}
for i in 0..<arr.count - 1 {
    var sum = arr.reduce(0) { $0 + $1 }
    answer += sum
    arr.removeFirst()
}

answer += arr[arr.count - 1]

print(answer)
