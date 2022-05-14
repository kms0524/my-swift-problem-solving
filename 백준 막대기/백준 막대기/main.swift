//
//  main.swift
//  백준 막대기
//
//  Created by 강민성 on 2021/09/01.
//

var X = Int(readLine()!)!
var bit = 0

while X > 0 {
    bit += X & 1 == 1 ? 1 : 0
    X >>= 1
}

print(bit)
