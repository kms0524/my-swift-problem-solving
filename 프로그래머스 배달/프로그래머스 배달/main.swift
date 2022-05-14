//
//  main.swift
//  프로그래머스 배달
//
//  Created by 강민성 on 2021/11/14.
//

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0

    let n = N
    let line = road
    let start = 1
    
    var allDistance = Array(repeating: Int.max, count: n + 1)
    
    func dijkstra() {
        
        allDistance[start] = 0
        
        var queue: [Int] = [start]
        
        while !queue.isEmpty {
            
            let first = queue.removeFirst()
            let filterNode = line.filter {
                $0[0] == first || $0[1] == first
            }
            
            for node in filterNode {
                let connectionNode = node[0] == first ? node[1] : node[0]
                
                if allDistance[first] == Int.max {
                    continue
                }
                
                if allDistance[first] + node[2] < allDistance[connectionNode] {
                    allDistance[connectionNode] = allDistance[first] + node[2]
                    queue.append(connectionNode)
                }
            }
        }
    }
    dijkstra()
    
    answer = allDistance.filter({ $0 <= k } ).count
    return answer
}

solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3)
