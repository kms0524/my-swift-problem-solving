//
//  main.swift
//  백준 Cubeditor
//
//  Created by 강민성 on 2022/07/21.
//

import Foundation

var input: [Character] = Array(readLine()!)

var answer = 0

func KMP(_ str: [Character]) -> Int {
    var j = 0
    
    var pi = [Int](repeating: 0, count: str.count)
    
    var maxValue = 0
    
    for i in 1..<str.count {
        while (j > 0 && str[j] != str[i]) {
            j = pi[j - 1]
        }
        
        if str[j] == str[i] {
            j += 1
            pi[i] = j
            maxValue = max(maxValue, pi[i])
        }
    }
    
    return maxValue
}


for i in 0..<input.count {
    var str: [Character] = Array(input[i..<input.count])
    answer = max(answer, KMP(str))
}

print(answer)

