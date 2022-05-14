//
//  main.swift
//  백준 보물
//
//  Created by 강민성 on 2022/05/10.
//

import Foundation

var N = Int(readLine()!)!

var A = readLine()!.split(separator: " ").map { Int($0)! }
var B = readLine()!.split(separator: " ").map { Int($0)! }

B.sort { $0 > $1 }
A.sort { $0 < $1 }

var sum = 0

for i in 0..<N {
    sum += A[i] * B[i]
}

print(sum)
