//
//  main.swift
//  백준 찾기
//
//  Created by 강민성 on 2022/08/04.
//

import Foundation

var T = readLine()!.map { String($0) }
var P = readLine()!.map { String($0) }

func failFunc(_ string: [String]) -> [Int] {
    
    var str = string
    var pi = [Int](repeating: 0, count: str.count)
    
    var i = 1
    var j = 0
    
    while i < str.count {
        while (j > 0 && str[i] != str[j]) {
            j = pi[j - 1]
        }
        
        if str[i] == str[j] {
            j += 1
            pi[i] = j
        }
        i += 1
    }
    
    return pi
}



var answer = [Int]()

var pi = failFunc(P)

var i = 0
var j = 0

while i < T.count {
    while (j > 0 && T[i] != P[j]) {
        j = pi[j - 1]
    }
    
    if T[i] == P[j] {
        if j == P.count - 1 {
            answer.append(i - P.count + 2)
            j = pi[j]
        }
        else {
            j += 1
        }
    }
    i += 1
}

var location = ""

print(answer.count)
answer.forEach {
    location += String($0)
    location += " "
}
print(location)
