//
//  main.swift
//  백준 팰린드롬인지 확인하기
//
//  Created by 강민성 on 2022/08/01.
//

import Foundation

var input = readLine()!.map { String($0) }

var left = 0
var right = input.count - 1

var flag = false

for i in 0..<input.count / 2 {
    if input[left] != input[right] {
        flag = true
        break
    }
    left += 1
    right -= 1
}

print(flag ? 0 : 1)
