//
//  main.swift
//  백준 스택 수열
//
//  Created by 강민성 on 2022/04/08.
//

import Foundation

var n = Int(readLine()!)!

var arr = [Int]()
var answer = [String]()
var current = 1
var flag = false

for i in 0..<n {
    
    var input = Int(readLine()!)!
    
    while input >= current {
        arr.append(current)
        answer.append("+")
        current += 1
    }
    
    if arr.last! == input {
        answer.append("-")
        arr.removeLast()
    }
    else {
        print("NO")
        flag = true
        break
    }
    
}

if flag == false {
    answer.forEach { str in
        print("\(str)")
    }
}
