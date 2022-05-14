//
//  main.swift
//  백준 랜선 자르기
//
//  Created by 강민성 on 2022/04/08.
//

import Foundation

var KN = readLine()!.split(separator: " ").map { Int($0)! }
var K = KN[0]
var N = KN[1]

var arr = [Int]()

for i in 0..<K {
    arr.append(Int(readLine()!)!)
}

var start = 1
var end = arr.max()!
var answer = 0

while start <= end {
    var mid = (start + end) / 2
    var count = 0
    
    arr.forEach {
        count += $0 / mid
    }
    
    if count < N {
        end = mid - 1
    }
    else {
        if answer < mid {
            answer = mid
        }
        start = mid + 1
    }
}

print(answer)

/*
 
 0(s) ... 802(e)
   457(m)
 
 0(s) ... 457(e)
   228(m)
 
 0(s) ... 228(e)
    114(m)
 
 114(s) ... 228(e)
    171(m)
 
 171(s) ... 228(e)
    199(m)
 
 199(s) ... 228(e)
 
 
 */
