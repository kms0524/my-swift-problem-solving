//
//  main.swift
//  백준 저울
//
//  Created by 강민성 on 2022/05/11.
//

import Foundation

var N = Int(readLine()!)!

var weights = readLine()!.split(separator: " ").map { Int($0)! }

var sum = 0

weights.sort()

weights.forEach {
    if $0 > sum + 1 {
        return
    }
    sum += $0
}

print(sum + 1)
