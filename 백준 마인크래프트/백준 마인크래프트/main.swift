//
//  main.swift
//  백준 마인크래프트
//
//  Created by 강민성 on 2022/04/19.
//
import Foundation

var NMB = readLine()!.split(separator: " ").map { Int($0)! }
var N = NMB[0]
var M = NMB[1]
var B = NMB[2]
var map = [[Int]]()
for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var arr = map.flatMap { $0 }

var maxValue = arr.max()!
var minValue = arr.min()!

var timeArr = [(Int, Int)]()

while true {
    
    if maxValue < minValue {
        break
    }
    
    var arr2 = arr.map {
        maxValue - $0
    }
    var inventory = B
    var buildSum = 0
    var timeSum = 0
    var minTime = Int.max
    
    arr2.forEach {
        if $0 < 0 {
            timeSum += 2 * abs($0)
            inventory += 1 * abs($0)
        }
        else if $0 > 0 {
            buildSum += 1 * $0
            timeSum += 1 * $0
            inventory -= 1 * $0
        }
    }
    
    if inventory >= 0 {
        minTime = timeSum
        timeArr.append((minTime, maxValue))
        if timeArr.count > 2 && timeArr[timeArr.count - 2].0 < minTime {
            break
        }
    }
    
    maxValue -= 1
    
}

var answer = timeArr.sorted {
    if $0.0 == $1.0 {
        return $0.1 > $1.1
    }
    return $0.0 < $1.0
}

print("\(answer[0].0) \(answer[0].1)")
