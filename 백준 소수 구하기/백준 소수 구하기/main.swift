//
//  main.swift
//  백준 소수 구하기
//
//  Created by 강민성 on 2022/04/08.
//

import Foundation

var MN = readLine()!.split(separator: " ").map { Int($0)! }
var M = MN[0]
var N = MN[1]

var arr = [Int]()

for i in M...N {
    arr.append(i)
}

var answer = arr.filter { isPrime($0) }

func isPrime(_ n: Int) -> Bool {
    guard n >= 2     else { return false }
    guard n != 2     else { return true  }
    guard n % 2 != 0 else { return false }
    return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
}


answer.forEach { print($0) }


//let input = readLine()!.split(separator: " ").map { Int($0)! }
//var arr = [Bool](repeating: true, count: 1000001)
//arr[1] = false
//var cur = 2
//for i in 2...1000 where arr[i] == true {
//    for j in 2...1000000/i {
//        arr[i*j] = false
//    }
//}
//var ret = ""
//for i in input[0]...input[1] {
//    if arr[i] {
//        ret += "\(i)\n"
//    }
//}
//print(ret)

