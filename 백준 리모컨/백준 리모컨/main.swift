//
//  main.swift
//  백준 리모컨
//
//  Created by 강민성 on 2022/04/22.
//

import Foundation

var N = Int(readLine()!)!
var M = Int(readLine()!)!
var answer = abs(N - 100)
var buttons = Set<Int>()

func solution(_ num: String) {
    
    if num.count >= 6 {
        return
    }
    
    for i in 0..<10 {
        if !buttons.contains(i) {
            answer = min(answer, abs(N - Int(num + String(i))!) + num.count + 1)
            solution(num + String(i))
        }
    }
}


if M == 0 {
    print(min(String(N).count, answer))
}
else {
    buttons = Set<Int>(readLine()!.split(separator: " ").map { Int($0)! })
    solution("")
    print(answer)
}
