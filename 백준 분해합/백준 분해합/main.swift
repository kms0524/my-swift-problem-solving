//
//  main.swift
//  백준 분해합
//
//  Created by 강민성 on 2022/04/08.
//

import Foundation

//var N = Int(readLine()!)!
//
//var current = 1
//var flag = false
//
//func calculate(num: String) -> Int {
//    let arr = num.map { Int(String($0))! }
//    let sum = arr.reduce(0) { $0 + $1 }
//
//    return Int(num)! + sum
//}
//
//
//for i in 0...1000000 {
//    if calculate(num: String(current)) == N {
//        print(current)
//        flag = true
//        break
//    }
//    current += 1
//}
//
//if flag == false {
//    print(0)
//}

var N = Int(readLine()!)!
var M = max(1, N-54)
print((M...N).first(where:{$0+String($0).reduce(0){$0+Int(String($1))!}==N}) ?? 0)
