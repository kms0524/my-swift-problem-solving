//
//  main.swift
//  백준 선분 그룹
//
//  Created by 강민성 on 2022/05/05.
//

import Foundation

struct Point {
    var x: Int
    var y: Int
}

struct Line {
    var p1: Point
    var p2: Point
}

func ccw(_ p1: Point, _ p2: Point, _ p3: Point) -> Int {
    
    var crossProduct = (p2.x - p1.x) * (p3.y - p1.y) - (p3.x - p1.x) * (p2.y - p1.y)
    
    if crossProduct > 0 {
        return 1
    }
    else if crossProduct < 0 {
        return -1
    }
    else {
        return 0
    }
}

func comparator(_ left: Point, _ right: Point) -> Bool {
    if left.x == right.x {
        return left.y <= right.y
    }
    else {
        return left.x <= right.x
    }
    
}

func lineIntersection(_ l1: inout Line, _ l2: inout Line) -> Bool {
    
    var l1_l2  = ccw(l1.p1, l1.p2, l2.p1) * ccw(l1.p1, l1.p2, l2.p2)
    var l2_l1  = ccw(l2.p1, l2.p2, l1.p1) * ccw(l2.p1, l2.p2, l1.p2)
    
    if l1_l2 == 0 && l2_l1 == 0 {
        if comparator(l1.p2, l1.p1) {
            swap(&l1.p1, &l1.p2)
        }
        
        if comparator(l2.p2, l2.p1) {
            swap(&l2.p1, &l2.p2)
        }
        
        return comparator(l2.p1, l1.p2) && comparator(l1.p1, l2.p2)
    }
    
    else {
        return (l1_l2 <= 0) && (l2_l1 <= 0)
    }
}

func find(_ value: Int) -> Int {
    if parent[value] == value {
        return value
    }
    
    parent[value] = find(parent[value])
    return parent[value]
}

func union(_ a: Int, _ b: Int) {
    var aRoot = find(a)
    var bRoot = find(b)
    
    if aRoot == bRoot {
        return
    }
    
    if rank[aRoot] < rank[bRoot] {
        swap(&aRoot, &bRoot)
    }
    
    parent[bRoot] = aRoot
    rank[aRoot] += rank[bRoot]
}

var N = Int(readLine()!)!

var parent = (0..<3000).map { $0 }
var rank = Array(repeating: 1, count: 3000)
var line = [Line]()

for i in 0..<N {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    line.append(Line(p1: Point(x: input[0], y: input[1]), p2: Point(x: input[2], y: input[3])))
}

for i in 0..<N - 1 {
    for j in i + 1..<N {
        var line1 = line[i]
        var line2 = line[j]
        guard lineIntersection(&line1, &line2) else {
            continue
        }
        
        union(i, j)
    }
}

print( Set((0..<N).map { find($0) }).count )
print(rank.max()!)
