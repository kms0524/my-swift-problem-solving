//
//  main.swift
//  백준 스타트와 링크
//
//  Created by 강민성 on 2021/08/27.
//

import Foundation

var N = Int(readLine()!)!
var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)

var answer = Int.max

for i in 0..<N {
    let input = Array(readLine()!.split(separator: " ").map{ Int($0)! })
    map[i] = input
}



func dfs(index: Int, depth: Int) {
    
    if depth == N / 2 {
        solution()
        return
    }
    
    for i in index..<N {
        
        if !visited[i] {
            visited[i] = true
            dfs(index: i + 1, depth: depth + 1)
            visited[i] = false
        }
    }
    
    
}

func solution() {
    
    var start = 0
    var link = 0
    
    for i in 0..<(N - 1) {
        for j in (i + 1)..<N {
            
            if visited[i] == true, visited[j] == true {
                start += map[i][j]
                start += map[j][i]
            }
            else if visited[i] == false, visited[j] == false {
                link += map[i][j]
                link += map[j][i]
            }
        }
    }
    
    let diff = abs(start - link)
    
    if diff == 0 {
        answer = 0
    }
    else {
        answer = min(answer, diff)
    }
    
}


dfs(index: 0, depth: 0)
print(answer)
