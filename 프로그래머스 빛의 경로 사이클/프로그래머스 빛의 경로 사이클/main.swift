//
//  main.swift
//  프로그래머스 빛의 경로 사이클
//
//  Created by 강민성 on 2021/11/07.
//

import Foundation

struct Node: Equatable {
    var x: Int
    var y: Int
    var dir: String
}

func solution(_ grid:[String]) -> [Int] {
    
    var answer: [Int] = []
    
    let map = grid.map{$0.map{String($0)}}
    var visited = Array(repeating: Array(
        repeating: ["down": false, "up" : false, "left" : false, "right" : false],
        count: map[0].count),count: map.count)
    let lightDirction = [
        "down": (0, 1),
        "up": (0, -1),
        "left": (-1, 0),
        "right": (1, 0)
    ]
    
    let next: [String: [String : String]] = [
        "S" : ["down" : "down",
               "up" : "up",
               "left" : "left",
               "right" : "right"
              ],
        
        "L" : ["down" : "right",
               "up" : "left",
               "left" : "down", // <-
               "right" : "up" // ->
              ],
        
        "R" : ["down": "left",
               "up" : "right",
               "left" : "up", // <-
               "right" : "down" // ->
              ]
    ]
    
    /*
     let lightDirction = [
     "down": (0, 1),
     "up": (0, -1),
     "left": (-1, 0),
     "right": (1, 0)
     ]
     */
    
    for y in 0..<map.count {
        for x in 0..<map[0].count {
            for dir in lightDirction.keys {
                
                var count = 0
                let start = Node(x: x, y: y, dir: dir)
                var current = start
                
                while true {
                    if visited[current.y][current.x][current.dir]! {
                        break
                    }
                    visited[current.y][current.x][current.dir] = true
                    
                    count += 1
                    
                    let direction = map[current.y][current.x]
                    current.dir = next[direction]![current.dir]!
                    current.x += lightDirction[current.dir]!.0
                    current.y += lightDirction[current.dir]!.1
                    current.x = current.x < 0 ? map[0].count - 1 : current.x % map[0].count
                    current.y = current.y < 0 ? map.count - 1 : current.y % map.count
                    print(current)
                    print(count)
                    if current == start && count != 0 {
                        answer.append(count)
                        break
                    }
                }
            }
        }
    }
    return answer.sorted()
}

print(solution(["SL","LR"]))
