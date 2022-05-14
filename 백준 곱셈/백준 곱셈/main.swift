//
//  main.swift
//  백준 곱셈
//
//  Created by 강민성 on 2022/05/02.
//

import Foundation

func power(_ A: Int, _ B: Int, _ C : Int) -> Int {
    
    if B == 1 {
        return A % C
    }
    
    var powered = power(A, B / 2, C)
    
    if B % 2 == 1 {
        return (powered * powered % C) * A % C
    }
    
    return powered * powered % C

}

var ABC = readLine()!.split(separator: " ").map { Int($0)! }

var A = ABC[0]
var B = ABC[1]
var C = ABC[2]

print(power(A, B, C))
