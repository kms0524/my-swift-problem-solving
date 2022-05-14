//
//  main.swift
//  백준 미로만들기
//
//  Created by 강민성 on 2021/08/09.
//

import Foundation

var n = Int(readLine()!)!

var dx = [1, -1, 0, 0]
var dy = [0, 0, 1, -1]

var INF = Int.max

var map: [[Int]] = Array(repeating: [], count: n)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)


for i in 0..<n {
    let input = readLine()!
    let inputArr = input.compactMap { $0.wholeNumberValue }
    
    map[i] = inputArr
}

visited[0][0] = true

var queue = [(Int, Int, Int)]()
queue.insert((0, 0, 0), at: 0)

while !queue.isEmpty {
    
    let nowX = queue.first!.0
    let nowY = queue.first!.1
    let nowCnt = queue.first!.2
    
    if nowX == n - 1 && nowY == n - 1{
        print(nowCnt)
        break
    }
    
    queue.removeFirst()
    
    for i in 0..<dx.count {
        
        let xx = nowX + dx[i]
        let yy = nowY + dy[i]
        
        if xx < 0 || xx >= n || yy < 0 || yy >= n {
            continue
        }
        
        if visited[xx][yy] == true {
            continue
        }
        
        if map[xx][yy] == 1 {
            queue.insert((xx, yy, nowCnt), at: 0)
        }
        else {
            queue.append((xx, yy, nowCnt + 1))
        }
        visited[xx][yy] = true
    }
}
