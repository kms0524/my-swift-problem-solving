//
//  main.swift
//  백준 암호 만들기
//
//  Created by 강민성 on 2021/08/30.
//

import Foundation

var LC = readLine()!.split(separator: " ").map{ Int($0)! }
var L = LC[0]
var C = LC[1]

var arr = readLine()!.split(separator: " ").map{ String($0) }
arr.sort()
var visited = Array(repeating: false, count: C)
var answer = ""


func dfs(depth: Int, index: Int, vowel: Int, consonant: Int) {
    if depth == L {
        if vowel >= 1 && consonant >= 2 {
            print(answer)
        }
        return
    }
    
    for i in index..<C {
        
        if visited[i] {
            continue
        }
        
        visited[i] = true
        answer += arr[i]
        if arr[i] == "a" || arr[i] == "e" || arr[i] == "i" || arr[i] == "o" || arr[i] == "u" {
            dfs(depth: depth + 1, index: i + 1, vowel: vowel + 1, consonant: consonant)
        }
        else {
            dfs(depth: depth + 1, index: i + 1, vowel: vowel, consonant: consonant + 1)
        }
        visited[i] = false
        answer.removeLast()
    }
    
}

dfs(depth: 0, index: 0, vowel: 0, consonant: 0)

