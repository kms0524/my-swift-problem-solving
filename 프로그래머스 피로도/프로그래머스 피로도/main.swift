//
//  main.swift
//  프로그래머스 피로도
//
//  Created by 강민성 on 2021/11/19.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {

    var visited = Array(repeating: false, count: dungeons.count)
    var maxValue = 0

    func dfs(dungeons: [[Int]], k: Int, depth: Int) {
        for i in 0..<dungeons.count {
            if !visited[i] {
                visited[i] = true
                if k >= dungeons[i][0] {
                    maxValue = max(maxValue, depth)
                    dfs(dungeons: dungeons, k: k - dungeons[i][1], depth: depth + 1)
                }
                visited[i] = false
            }
        }
    }

    dfs(dungeons: dungeons, k: k, depth: 1)

    return maxValue
}


/*
func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
    return explore(k, dungeons, 0)
}

private func explore(_ k: Int, _ dungeons: [[Int]], _ depth: Int) -> Int {
    print(dungeons)
    return dungeons.map { dungeon in
        k >= dungeon[0] ?
        explore(k - dungeon[1], dungeons.filter { elem in dungeon != elem }, depth + 1) : depth
    }.max() ?? depth
}
 
 */


solution(80, [[80,20],[50,40],[30,10]])
