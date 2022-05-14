//
//  main.swift
//  백준 토마토
//
//  Created by 강민성 on 2021/07/23.
//

/*
 queue를 Array로 선언하고 removeFirst를 했지만
 removeFirst의 시간복잡도는 O(N)이라 시간초과가 떳다.
 
 해결법: Queue를 2중 포인터를 사용해 직접 구현하여
 array.count, array.isEmpty, array.append, array.removeFirst를
 queue.size, queue.isEmpty, queue.push, queue.pop을 만들어서 다시 해봤더니
 시간초과가 나오지 않았다.
 */

import Foundation

struct Queue<T> {
    var list: [T]
    
    var from = 0
    var to = 0
    
    func size() -> Int {
        return to - from
    }
    
    func isEmpty() -> Bool {
        return size() == 0 ? true : false
    }
    
    mutating func push(_ element: T) {
        to += 1
        list.append(element)
    }
    
    mutating func pop() -> T? {
        if isEmpty() {
            return nil
        }
        else {
            let target = list[from]
            from += 1
            return target
        }
    }
}


var input = readLine()!.split(separator: " ").map{ Int($0)! }

var M = input[0]
var N = input[1]
var map = [[Int]](repeating: [Int](), count: N)
var queue = Queue<[(Int, Int)]>(list: [], from: 0, to: 0)
var count = -1

var dx = [1, -1, 0, 0]
var dy = [0, 0, 1, -1]

for i in 0..<N {
    map[i] = Array(readLine()!.split(separator: " ").map{ Int($0)! })
    
}

for i in map.indices {
    for j in map[i].indices{
        if map[i][j] == 1 {
            queue.push([(i, j)])
        }
    }
}

while !queue.isEmpty() {
    count += 1
    for _ in 0..<queue.size() {
        let current = queue.pop()!
        for i in 0..<dx.count {
            let xx = current[0].0 + dx[i]
            let yy = current[0].1 + dy[i]
            
            if xx >= 0 && xx < N && yy >= 0 && yy < M {
                if map[xx][yy] == 0 {
                    map[xx][yy] = 1
                    queue.push([(xx, yy)])
                }
            }
        }
    }
}

for i in map {
    if i.contains(0){
        count = -1
    }
}

print(count)
