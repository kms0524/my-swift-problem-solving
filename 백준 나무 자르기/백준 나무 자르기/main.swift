//
//  main.swift
//  백준 나무 자르기
//
//  Created by 강민성 on 2022/04/14.
//

import Foundation

var NM = readLine()!.split(separator: " ").map { Int($0)! }

var N = NM[0]
var M = NM[1]

var arr = readLine()!.split(separator: " ").map { Int($0)! }


var start = 0
var end = arr.max()!

while start <= end {
    var mid = (start + end) / 2
    
    var sum = 0
    
    arr.forEach { num in
        var num = num - mid
        if num > 0 {
            sum += num
        }
    }
    
    if sum < M {
        end = mid - 1
    }
    else {
        start = mid + 1
    }
    
}

print(end)
