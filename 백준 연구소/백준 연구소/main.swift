//
//  main.swift
//  백준 연구소
//
//  Created by 강민성 on 2022/05/20.
//

import Foundation

struct Queue<T> {
    var nodes: [T] = []
    var idx = 0

    var isEmpty: Bool {
        return !(nodes.count > idx)
    }

    mutating func enqueue(_ element: T) {
        nodes.append(element)
    }

    mutating func dequeue() -> T {
        defer {
            idx += 1
        }
        return nodes[idx]
    }
}

var NM = readLine()!.split(separator: " ").map { Int($0)! }

var N = NM[0]
var M = NM[1]

var dx = [0, 0, 1, -1]
var dy = [1, -1, 0, 0]

var answer = 0

var map = [[Int]]()

for i in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func dfs(_ depth: Int) {

    if depth == 3 {
        bfs()
        return
    }

    for i in 0..<N {
        for j in 0..<M {
            if map[i][j] == 0 {
                map[i][j] = 1
                dfs(depth + 1)
                map[i][j] = 0
            }
        }
    }

}

func bfs() {
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    var temp = map

    var queue = Queue<Int>()

    for i in 0..<N {
        for j in 0..<M {
            if temp[i][j] == 2 {
                queue.enqueue(i * 10 + j)
            }
        }
    }
    while !queue.isEmpty {
        var current = queue.dequeue()

        var curX = current / 10
        var curY = current % 10

        for i in 0..<4 {
            var xx = curX + dx[i]
            var yy = curY + dy[i]

            if xx >= 0 && xx < N && yy >= 0 && yy < M {
                if temp[xx][yy] == 0 && !visited[xx][yy] {
                    visited[xx][yy] = true
                    temp[xx][yy] = 2
                    queue.enqueue(xx * 10 + yy)
                }
            }
        }
    }

    var count = 0

    for i in 0..<N {
        for j in 0..<M {
            if temp[i][j] == 0 {
                count += 1
            }
        }
    }

    answer = max(answer, count)
}

dfs(0)

print(answer)


