//
//  main.swift
//  백준 N-Queen
//
//  Created by 강민성 on 2021/08/24.
//

import Foundation

let N = Int(readLine()!)!

var col = Array(repeating: false, count: N)
var downRightCol = Array(repeating: false, count: (2 * N) - 1)
var downLeftCol = Array(repeating: false, count: (2 * N) - 1)

var count = 0

func dfs(depth: Int) {
    
    if depth == N {
        count += 1
        return
    }
    
    for i in 0..<N {
        
        if !(col[i] || downRightCol[depth + i] || downLeftCol[depth - i + N - 1]) {
            
            col[i] = true
            downRightCol[depth + i] = true
            downLeftCol[depth - i + N - 1] = true
            
            dfs(depth: depth + 1)
            
            col[i] = false
            downRightCol[depth + i] = false
            downLeftCol[depth - i + N - 1] = false
            
        }
    }
}

dfs(depth: 0)
print(count)
