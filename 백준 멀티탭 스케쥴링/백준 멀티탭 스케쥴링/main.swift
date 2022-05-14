//
//  main.swift
//  백준 멀티탭 스케쥴링
//
//  Created by 강민성 on 2022/05/11.
//

/// https://woongsios.tistory.com/139
/// LRU 알고리즘을 사용해야할듯...?

import Foundation

var NK = readLine()!.split(separator: " ").map { Int($0)! }

var N = NK[0]
var K = NK[1]

var input = readLine()!.split(separator: " ").map { Int($0)! }
var arr = [Int]()
var answer = 0

for (i, value) in input.enumerated() {
    if arr.contains(value) {
        continue
    }
    
    else if arr.count < N {
        arr.append(value)
    }
    else {
        
        var count = -1
        var least = -1
        
        for (index, value) in arr.enumerated() {
            
            var current = -1
            
            for currentIndex in i+1..<input.count {
                if value == input[currentIndex] {
                    current = currentIndex
                    break
                }
            }
            
            if current == -1 {
                count = index
                break
            }
            else {
                if current > least {
                    least = current
                    count = index
                }
            }
        }
        
        arr[count] = value
        answer += 1
    }
}

print(answer)
