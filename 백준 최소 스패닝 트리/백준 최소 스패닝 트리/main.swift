//
//  main.swift
//  백준 최소 스패닝 트리
//
//  Created by 강민성 on 2022/05/06.
//

import Foundation

func find(_ value: Int) -> Int {
    if parent[value] == value {
        return value
    }
    
    parent[value] = find(parent[value])
    return parent[value]
}

func union(_ a: Int, _ b: Int) -> Bool {
    let aRoot = find(a)
    let bRoot = find(b)
    
    if aRoot == bRoot {
        return false
    }
    else {
        parent[bRoot] = aRoot
        return true
    }
}

func kruskal(_ edges: [(Int, Int, Int)]) -> Int {
    
    var count = 0
    var sum = 0
    
    var edges = edges.sorted { $0.2 < $1.2 }
    
    for current in edges {
        
        var start = current.0
        var end = current.1
        var weight = current.2
        
        if union(start, end) == true {
            sum += weight
            count += 1
            if count == V - 1 {
                return sum
            }
        }
    }
    
    return 0
}

var VE = readLine()!.split(separator: " ").map { Int($0)! }

var V = VE[0]
var E = VE[1]

var parent = (0..<(V + 1)).map{ $0 }
var edges = [(Int, Int, Int)]()


for i in 0..<E {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    edges.append((input[0], input[1], input[2]))
}


print(kruskal(edges))
