//
//  main.swift
//  백준 크게 만들기
//
//  Created by 강민성 on 2022/05/15.
//

import Foundation

var NK = readLine()!.split(separator: " ").map{Int(String($0))!}
var N = NK[0]
var K = NK[1]

let number = Array(readLine()!)
var stack = [Character]()

for num in number {
    while K > 0 && !stack.isEmpty && stack.last! < num {
        stack.removeLast()
        K -= 1
    }
    stack.append(num)
}

for i in 0..<K {
    stack.removeLast()
}

print(String(stack))
