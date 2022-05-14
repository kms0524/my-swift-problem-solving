//
//  main.swift
//  백준 소수 찾기
//
//  Created by 강민성 on 2022/04/08.
//

import Foundation

var N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }

func isPrime(_ n: Int) -> Bool {
    guard n >= 2     else { return false }
    guard n != 2     else { return true  }
    guard n % 2 != 0 else { return false }
    return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
}

var answer = arr.filter { isPrime($0) }

print(answer.count)
