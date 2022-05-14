//
//  main.swift
//  백준 최대공약수와 최소공배수
//
//  Created by 강민성 on 2022/04/11.
//

import Foundation

func getGCD(_ m: Int, _ n: Int) -> Int {
    let r: Int = m % n
    if r != 0 {
        return getGCD(n, r)
    } else {
        return n
    }
}

func getLCM(_ a: Int, _ b: Int) -> Int {
    return a * b / getGCD(a, b)
}

var input = readLine()!.split(separator: " ").map { Int($0)! }

print(getGCD(input[0], input[1]))
print(getLCM(input[0], input[1]))
