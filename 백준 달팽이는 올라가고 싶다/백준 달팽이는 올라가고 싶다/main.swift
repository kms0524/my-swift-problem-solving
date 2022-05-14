//
//  main.swift
//  백준 달팽이는 올라가고 싶다
//
//  Created by 강민성 on 2022/04/14.
//

import Foundation

var ABV = readLine()!.split(separator: " ").map { Double($0)! }

var A = ABV[0]
var B = ABV[1]
var V = ABV[2]

print(Int(ceil((V - B) / (A - B))))
