//
//  main.swift
//  백준 녹색 옷을 입은 애가 젤다지?_2
//
//  Created by 강민성 on 2021/08/09.
//

import Foundation

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

var testCount = 0

while true {
    
    testCount += 1
    
    var N = Int(readLine()!)!
    
    if N == 0 {
        break
    }
    
    var map: [[Int]] = Array(repeating: [], count: N)
    var resultMap: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
    
    for i in 0..<N {
        map[i] = Array(readLine()!.split(separator: " ").map{ Int($0)! })
    }
    
    var queue: [Int] = []
    
    visited[0][0] = true
    resultMap[0][0] = map[0][0]
    
    while !queue.isEmpty {
        
        let now = queue.removeFirst()
        
        for i in 0..<dx.count {
            
            let xx = now
        }
    }
    
    
    
    
}
