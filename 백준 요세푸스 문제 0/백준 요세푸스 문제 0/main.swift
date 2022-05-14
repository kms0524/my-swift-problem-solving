//
//  main.swift
//  백준 요세푸스 문제 0
//
//  Created by 강민성 on 2022/04/18.
//

import Foundation

var NK = readLine()!.split(separator: " ").map { Int($0)! }

var N = NK[0]
var K = NK[1]

var arr = [Int](1...N)

var answer = [Int]()
var count = 1
while !arr.isEmpty {
    
    if count == K {
        answer.append(arr[0])
        arr.removeFirst()
        count = 1
    }
    else {
        arr.append(arr[0])
        arr.removeFirst()
        count += 1
    }
    
}

print(answer.description.replacingOccurrences(of: "[", with: "<").replacingOccurrences(of: "]", with: ">"))

/*
 1 2 3 4 5 6 7 8 9 10
 1 2 3 4 6 7 8 9 / 5 10
 1 2 3 4 7 8 9 / 6
 1 2 3 4 8 9 / 7
 
 */
