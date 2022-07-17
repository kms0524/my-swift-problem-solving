//
//  main.swift
//  백준 용액
//
//  Created by 강민성 on 2022/07/15.
//

import Foundation

var N = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map { Int64($0)! }


var first = 0
var last = arr.count - 1

var temp = abs(arr[first] + arr[last])
var answer: (Int64, Int64) = (arr[first], arr[last])

while first < last {
    var sum = arr[first] + arr[last]
    
    if abs(sum) < temp {
        temp = abs(sum)
        answer = (arr[first], arr[last])
    }
    
    
    if sum < 0 {
        first += 1
    }
    else {
        last -= 1
    }
}

print("\(answer.0) \(answer.1)")
