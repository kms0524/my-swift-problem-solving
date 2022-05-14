//
//  main.swift
//  백준 행렬 제곱
//
//  Created by 강민성 on 2022/05/02.
//

import Foundation

func multiply(_ arr1: [[Int]], _ arr2: [[Int]]) -> [[Int]] {
    
    var multiplied = [[Int]](repeating: Array(repeating: 0, count: arr1.count), count: arr1.count)
    
    for i in 0..<arr1.count {
        for j in 0..<arr2.count {
            for k in 0..<arr1.count {
                multiplied[i][j] += arr1[i][k] * arr2[k][j]
                multiplied[i][j] %= 1000
            }
        }
    }
    
    return multiplied
}

func power(_ arr: [[Int]], _ expotential: Int) -> [[Int]] {
    
    if expotential == 1 {
        return arr
    }
    
    var powered = power(arr, expotential / 2)
    
    powered = multiply(powered, powered)
    
    if expotential % 2 == 1 {
        powered = multiply(powered, input)
    }
    
    return powered
}

var NB = readLine()!.split(separator: " ").map { Int($0)! }

var N = NB[0]
var B = NB[1]

var input = [[Int]]()
var answer = [[Int]]()
for i in 0..<N {
    input.append(readLine()!.split(separator: " ").map { Int($0)! }.map { $0 % 1000 } )
}

answer = power(input, B)

answer.forEach { arr in
    var str = ""
    arr.forEach { num in
        str += "\(num) "
    }
    print(str)
}
