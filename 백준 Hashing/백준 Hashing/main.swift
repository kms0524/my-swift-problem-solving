//
//  main.swift
//  백준 Hashing
//
//  Created by 강민성 on 2022/04/19.
//

import Foundation

var L = Int(readLine()!)!

var arr = readLine()!.map { Character(String($0)) }.map { Int($0.asciiValue!) - 96 }
var sum = 0
var power = 1
for i in 0..<arr.count {
    sum = (sum + arr[i] * power) % 1234567891
    power = (power * 31) % 1234567891
//    sum = sum + arr[i] * Int(pow(Double(31), Double(i)))
}

print(sum)
