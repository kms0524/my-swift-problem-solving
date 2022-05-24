//
//  main.swift
//  백준 로봇 청소기
//
//  Created by 강민성 on 2022/05/24.
//

import Foundation

var NM = readLine()!.split(separator: " ").map { Int($0)! }

var N = NM[0]
var M = NM[1]

var map = [[Int]]()

var start = readLine()!.split(separator: " ").map { Int($0)! }
var startX = start[1]
var startY = start[0]
var startD = start[2]

for i in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)

func leftArea(_ x: Int, _ y: Int, _ d: Int) -> (Int, Int) {
    switch d {
    case 0 :
        return ((x - 1) , y)
    case 1 :
        return (x, (y - 1))
    case 2 :
        return ((x + 1), y)
    case 3 :
        return (x, (y + 1))
    default:
        return (0, 0)
    }
}

func backwardArea(_ x: Int, _ y: Int, _ d: Int) -> (Int, Int) {
    switch d {
    case 0 :
        return (x , (y + 1))
    case 1 :
        return ((x - 1), y)
    case 2 :
        return (x , (y - 1))
    case 3 :
        return ((x + 1), y)
    default:
        return (0, 0)
    }
}

var rotateCount = 0
var count = 1

while true {
    
    visited[startY][startX] = true
    count += 1
    
    var left = leftArea(startX, startY, startD)
    var leftX = left.0
    var leftY = left.1
    
    if map[leftY][leftX] == 0 && visited[leftY][leftX] == false {
        startD = (startD + 3) % 4
        startX = leftX
        startY = leftY
        rotateCount = 0
    }
    else {
        count -= 1
        startD = (startD + 3) % 4
        rotateCount += 1
        if rotateCount == 4 {
            var back = backwardArea(startX, startY, startD)
            var backX = back.0
            var backY = back.1
            
            if map[backY][backX] == 1 {
                break
            }
            else {
                startX = backX
                startY = backY
            }
            rotateCount = 0
        }
    }
    
}

print(count)


/*
 1 1 1 1 1 1 1 1 1 1
 1 0 0 0 0 0 0 0 0 1
 1 0 0 0 1 1 1 1 0 1
 1 0 0 1 1 0 0 0 0 1
 1 0 1 1 0 0 0 0 0 1
 1 0 0 0 0 0 0 0 0 1
 1 0 0 0 0 0 0 1 0 1
 1 0 0 0 0 0 1 1 0 1
 1 0 0 1 1 0 1 1 0 1
 1 0 0 1 1 0 0 0 0 1
 1 1 1 1 1 1 1 1 1 1
 
 0 -> 3 -> 2 -> 1
 */
