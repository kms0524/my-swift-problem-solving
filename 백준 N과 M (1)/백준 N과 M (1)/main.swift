//
//  main.swift
//  백준 N과 M (1)
//
//  Created by 강민성 on 2021/08/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }

let N = input[0]
let M = input[1]

var arr = Array(repeating: 0, count: M)
var visited = Array(repeating: false, count: N)

var answer = ""


func dfs(depth: Int) {
    
    if depth == Int(M) {
        
        for i in 0..<arr.count {
            answer.append(String(arr[i]))
            answer.append(" ")
        }
        answer.append("\n")
        return
    }
    
    for i in 0..<N {
        if !visited[i] {
            visited[i] = true
            arr[depth] = i + 1
            dfs(depth: depth + 1)
            visited[i] = false
        }
    }
    
}

dfs(depth: 0)

print(answer)
