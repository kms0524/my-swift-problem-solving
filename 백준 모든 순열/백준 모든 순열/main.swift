//
//  main.swift
//  백준 모든 순열
//
//  Created by 강민성 on 2021/08/24.
//

import Foundation

func permutatation<T>(_ a: [T], _ n: Int) -> [T] {
    
    if n == 0 {
        print(a)
    }
    
    else {
        var a = a
        permutatation(a, n - 1)
        
        for i in 0..<n {
            a.swapAt(i, n)
            permutatation(a, n - 1)
            a.swapAt(i, n)
        }
    }
    
    return a
}

let arr = [1, 2, 3]

let answer: [Int] = []

while true {
    
    var a = permutatation(arr, arr.count - 1)
    
    if a.isEmpty {
        break
    }
    
    
    
}


