//
//  main.swift
//  백준 광고
//
//  Created by 강민성 on 2022/08/04.
//

import Foundation

/*
 ㅁㅁㅁㅁㅁㅁ -> 1
 ㅁㅁㅁㅁㅁㄴ -> 6
 ㅁㅁㅁㄴㅁㅁ -> 4
 ㅁㅁㄴㅁㅁㄴ -> 3
 ㅁㅁㅁㅁㄹㅁ -> 6
 ㅁㅁㅁㄹㅁㅁ -> 6
 ㅁㄴㅁㄴㅁㄴ -> 2
 ㅁㄴㅇㅂㅈㄱ -> 6
 
 */

var L = Int(readLine()!)!

var str = readLine()!.map { String($0) }
var pi = [Int](repeating: 0, count: L)
var i = 1
var j = 0

while i < L {
    while (j > 0 && str[i] != str[j]) {
        j = pi[j - 1]
    }
    
    if str[i] == str[j] {
        j += 1
        pi[i] = j
    }
    i += 1
}

print(L - pi[L - 1])
