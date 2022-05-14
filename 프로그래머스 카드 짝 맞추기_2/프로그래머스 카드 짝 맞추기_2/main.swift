//
//  main.swift
//  프로그래머스 카드 짝 맞추기_2
//
//  Created by 강민성 on 2021/09/07.
//

import Foundation

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    
    let direction = [(0, 1), (1, 0), (-1, 0), (0, -1)]
    var dic = [Int: [(Int , Int)]]()
    
    var answer = Int.max
    var goal = [(r, c)]
    
    for i in 0..<4 {
        for j in 0..<4 {
            
            if board[i][j] != 0 {
                let current = board[i][j]
                
                if dic[current] == nil {
                    dic[current] = [(i, j)]
                }
                else {
                    dic[current]!.append((i, j))
                }
            }
        }
    }
    
    var visited = Array(repeating: false, count: dic.count + 1)
    
    
    func permutation() {
        
        if goal.count == dic.count * 2 + 1 {
            search(goal)
            return
        }
        
        for path in dic.keys {
            
            if visited[path] == false {
                visited[path] = true
                goal.append(contentsOf: [dic[path]![0], dic[path]![1]])
                permutation()
                goal.removeLast()
                goal.removeLast()
                
                goal.append(contentsOf: [dic[path]![1], dic[path]![0]])
                permutation()
                goal.removeLast()
                goal.removeLast()
                
                visited[path] = false
            }
        }
    }
    
    func search(_ goal: [(Int, Int)]) {
        
        var count = 0
        var temp = board
        
        for i in 0..<goal.count - 1 {
            count += bfs(goal[i], goal[i + 1], &temp, i % 2 == 1)
            
            if answer <= count {
                return
            }
        }
        
        answer = min(answer, count)
    }
    
    func bfs(_ start: (Int, Int), _ end: (Int, Int), _ arr: inout [[Int]], _ isPair: Bool) -> Int {
        
        var dp = Array(repeating: Array(repeating: Int.max, count: 4), count: 4)
        
        var queue = [(start, 0)]
        var least = Int.max
        
        if start == end {
            
            if isPair {
                arr[start.0][start.1] = 0
                arr[end.0][end.1] = 0
            }
            return 1
        }
        
        dp[start.0][start.1] = 0
        
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            if current.0 == end {
                least = min(least, current.1 + 1)
                break
            }
            
            for i in 0..<4 {
                let next = (current.0.0 + direction[i].0, current.0.1 + direction[i].1)
                if next.0 >= 4 || next.0 < 0 || next.1 >= 4 || next.1 < 0 {
                    continue
                }
                
                if dp[next.0][next.1] > current.1 + 1 {
                    dp[next.0][next.1] = current.1 + 1
                    queue.append((next, current.1 + 1))
                    
                }
            }
            
            for i in 0..<4 {
                
                var next = current.0
                var check = false
                for _ in 0..<4 {
                    next.0 += direction[i].0
                    next.1 += direction[i].1
                    
                    if next.0 >= 4 || next.0 < 0 || next.1 >= 4 || next.1 < 0 {
                        break
                    }
                    if arr[next.0][next.1] != 0 {
                        check = true
                        break
                    }
                }
                
                if check {
                    if dp[next.0][next.1] > current.1 + 1 {
                        dp[next.0][next.1] = current.1 + 1
                        queue.append(((next), current.1 + 1))
                    }
                }
                else {
                    next = (next.0 - direction[i].0, next.1 - direction[i].1)
                    if next == current.0 {
                        continue
                    }
                    
                    if dp[next.0][next.1] > current.1 + 1 {
                        dp[next.0][next.1] = current.1 + 1
                        queue.append((next, current.1 + 1))
                    }
                }
            }
        }
        
        if isPair {
            arr[start.0][start.1] = 0
            arr[end.0][end.1] = 0
        }
        
        return least
    }
    
    
    permutation()
    
    return answer
}

print(solution([[1,0,0,3],[2,0,0,0],[0,0,0,2],[3,0,1,0]], 1, 0))

