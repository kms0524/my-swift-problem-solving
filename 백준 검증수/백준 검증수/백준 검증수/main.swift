//
//  main.swift
//  백준 검증수
//
//  Created by 강민성 on 2022/03/31.
//

import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }

var mul = input.map { $0 * $0 }
var answer = 0

mul.forEach { num in
    answer += num
}

answer %= 10

print(answer)
