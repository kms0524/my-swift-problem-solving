//
//  main.swift
//  백준 본대 산책2
//
//  Created by 강민성 on 2022/07/17.
//

import Foundation


/*
 정보 전산 미래 신양 진리 한경 학생 형남
 정보  0  1   1   0   0  0   0   0
 전산  1  0   1   1   0  0   0   0
 미래  1  1   0   1   0  1   0   0
 신양  0  1   1   0   1  1   0   0
 진리  0  0   0   1   0  1   1   0
 한경  0  0   1   1   1  0   0   1
 학생  0  0   0   0   1  0   0   1
 형남  0  0   0   0   0  1   1   0
 */

var D = Int(readLine()!)!

var mod = 1000000007

var matrix = [[0, 1, 1, 0, 0, 0, 0, 0],
              [1, 0, 1, 1, 0, 0, 0, 0],
              [1, 1, 0, 1, 0, 1, 0, 0],
              [0, 1, 1, 0, 1, 1, 0, 0],
              [0, 0, 0, 1, 0, 1, 1, 0],
              [0, 0, 1, 1, 1, 0, 0, 1],
              [0, 0, 0, 0, 1, 0, 0, 1],
              [0, 0, 0, 0, 0, 1, 1, 0]]

func multiply(_ matrix1: [[Int]], _ matrix2: [[Int]]) -> [[Int]] {
    
    var multiplied = [[Int]](repeating: [Int](repeating: 0, count: 8), count: 8)
    
    for i in 0..<matrix1.count {
        for j in 0..<matrix1.count {
            for k in 0..<matrix1.count {
                multiplied[i][j] += matrix1[i][k] * matrix2[k][j]
                multiplied[i][j] %= mod
            }
        }
    }
    return multiplied
    
}

func fastPower(_ matrix: [[Int]], _ D: Int) -> [[Int]] {
    
    if D == 1 {
        return matrix
    }
    else {
        if D % 2 == 1 {
            return multiply(matrix, fastPower(multiply(matrix, matrix), D / 2))
        }
        else {
            return fastPower(multiply(matrix, matrix), D / 2)
        }
    }
}

print(fastPower(matrix, D)[0][0])

/*
 
 1100 * 0100
 12 * 4 = 48
 110000
 
 */
