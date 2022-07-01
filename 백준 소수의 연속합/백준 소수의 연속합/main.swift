//
//  main.swift
//  백준 소수의 연속합
//
//  Created by 강민성 on 2022/07/01.
//

import Foundation

var N = Int(readLine()!)!

var prime = [Int](repeating: 0, count: 4000001)

if N == 1 {
    print(0)
}
else {
    
    for i in 2...N {
        prime[i] = i
    }
    
    for i in 2...N {
        if prime[i] == 0 {
            continue
        }
        
        for j in stride(from: i + i, through: N, by: i) {
            prime[j] = 0
        }
    }
    
    var end = 1
    var count = 0
    var sum = 0
    
    for i in 1...N {
        if prime[i] == 0 {
            continue
        }
        
        while sum < N && end <= N {
            if prime[end] != 0 {
                sum += end
            }
            end += 1
        }
        
        if sum == N {
            count += 1
        }
        
        sum -= prime[i]
    }
    
    print(count)
    
}
