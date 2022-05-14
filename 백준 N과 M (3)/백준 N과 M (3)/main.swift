//
//  main.swift
//  백준 N과 M (3)
//
//  Created by 강민성 on 2021/08/27.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let N = input[0]
let M = input[1]


func dfs(string: String, depth: Int) {
    
    if depth == Int(M) {
        print(string)
        return
    }
    
    for i in 1...N {
        dfs(string: string + "\(i) ", depth: depth + 1)
    }
}

for i in 1...N {
    dfs(string: "\(i) ", depth: 1)
}
