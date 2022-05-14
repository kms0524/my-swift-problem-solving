//
//  main.swift
//  백준 이항 계수 1
//
//  Created by 강민성 on 2022/04/18.
//

import Foundation

func factorial(_ n: Int) -> Int {
    if n == 0 {
        return 1
    }
    return n * factorial(n - 1)
}

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]

print(factorial(N) / (factorial(K) * factorial(N - K)))
