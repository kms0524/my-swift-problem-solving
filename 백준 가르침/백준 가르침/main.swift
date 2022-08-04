//
//  main.swift
//  백준 가르침
//
//  Created by 강민성 on 2022/07/13.
//

import Foundation

/*
 
 a n t i c
 
 r
 hello
 r
 
 */

var NK = readLine()!.split(separator: " ").map { Int($0)! }

var N = NK[0]
var K = NK[1]

var bit = 0
var bitsArr = [Int](repeating: 0, count: 50)

//var excludeWord = ["a", "n", "t", "c", "i"]
var excludeBits = 532741

var answer = 0

func dfs(_ depth: Int, _ alphabet: Int) {
    var count = 0
    
    if depth == K {
        for i in 0..<N {
            if bitsArr[i] & excludeBits == bitsArr[i] {
                count += 1
            }
        }
        answer = max(answer, count)
    }
    
    for i in alphabet...25 {
        if excludeBits & (1 << i) == 0 {
            excludeBits |= (1 << i)
            dfs(depth + 1, i)
            excludeBits &= ~(1 << i)
        }
    }
}


if K < 5 {
    print(0)
}
else {
    for i in 0..<N {
        var input = readLine()!.map { String($0) }
        for j in 0..<input.count {
            bitsArr[i] |= 1 << (Int(Character(input[j]).asciiValue! - Character("a").asciiValue!))
        }
    }
    
    K -= 5
    
    dfs(0, 0)
    
    print(answer)
    
}
