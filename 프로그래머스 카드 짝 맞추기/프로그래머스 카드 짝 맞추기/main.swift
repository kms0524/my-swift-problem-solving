//
//  main.swift
//  프로그래머스 카드 짝 맞추기
//
//  Created by 강민성 on 2021/08/21.
//

import Foundation

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    
    var answer = Int.max
    
    var cardCount = 0
    
    cardCount = board.flatMap{ $0 }.filter{ $0 != 0 }.count
    
    let cards = findNumberOfCardLocation(board: board)
    
    setup(answer: &answer, cardCount: &cardCount, board: board, start: (c, r), count: 0, cards: cards, depth: [])
    
    return answer + cardCount
}

func setup(answer: inout Int, cardCount: inout Int, board:[[Int]], start: (Int, Int), count: Int, cards: [[(Int, Int)]], depth: [Int]) {
    
    if answer != Int.max && count >= answer {
        return
    }
    
    if depth.count == cardCount / 2 && answer > count {
        answer = count
        return
    }
    
    for (i, card) in cards.enumerated() {
        
        var newBoard = board
        var newDepth = depth
        var newCards = cards
        
        
        if card.isEmpty {
            continue
        }
        
        let count1 = moveCurrentToGoal(current: start, goal: card[0], count: 0, board: board) + moveCurrentToGoal(current: card[0], goal: card[1], count: 0, board: board)
        
        let count2 = moveCurrentToGoal(current: start, goal: card[1], count: 0, board: board) + moveCurrentToGoal(current: card[1], goal: card[0], count: 0, board: board)
        
        newCards[i] = []
        
        newBoard[card[0].1][card[0].0] = 0
        
        newBoard[card[1].1][card[1].0] = 0
        
        newDepth.append(i)
        
        if count1 < count2 {
            setup(answer: &answer, cardCount: &cardCount, board: newBoard, start: card[1], count: count + count1, cards: newCards, depth: newDepth)
        } else {
            setup(answer: &answer, cardCount: &cardCount, board: newBoard, start: card[0], count: count + count2, cards: newCards, depth: newDepth)
        }
    }
}

func findNumberOfCardLocation(board: [[Int]]) -> [[(Int, Int)]] {
    
    var newCards = Array(repeating: [(Int, Int)](), count: 7)
    
    for (y, row) in board.enumerated() {
        
        for (x, num) in row.enumerated() {
            
            if num != 0 {
                newCards[num].append((x, y))
            }
        }
    }
    
    return newCards
}


func moveCurrentToGoal(current: (Int, Int), goal: (Int, Int), count: Int, board: [[Int]]) -> Int {
    
    var min = Int.max
    
    var queue: [((Int, Int), (Int, Int), Int, [[Int]])] = [(current, goal, count, board)]
    
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: 4), count: 4)
    
    while !queue.isEmpty {
        if min != Int.max {
            return min
        }
        
        let first = queue.removeFirst()
        
        bfs(current: first.0, goal: first.1, count: first.2, board: first.3, min: &min, queue: &queue, visited: &visited)
    }
    
    return min
}


func bfs(current: (Int, Int), goal: (Int, Int), count: Int, board: [[Int]], min: inout Int, queue: inout [((Int, Int), (Int, Int), Int, [[Int]])], visited: inout [[Bool]]) {
    
    
    if current.0 > 3 || current.1 > 3 || current.0 < 0 || current.1 < 0 {
        return
    }
    
    if visited[current.1][current.0] == false {
        visited[current.1][current.0] = true
    }
    else {
        return
    }
    
    
    if current == goal {
        min = count
        return
    }
    
    let moves = [
        
        moveLeft(current: current),
        moveRight(current: current),
        moveUp(current: current),
        moveDown(current: current),
        moveCtrlLeft(goalX: goal.0, currentX: current.0, y: current.1, board: board),
        moveCtrlRight(goalX: goal.0, currentX: current.0, y: current.1, board: board),
        moveCtrlUp(goalY: goal.1, currentY: current.1, x: current.0, board: board),
        moveCtrlDown(goalY: goal.1, currentY: current.1, x: current.0, board: board)
        
    ]
    
    for move in moves {
        if current.0 <= 3 && current.0 >= 0 && current.1 <= 3 && current.1 >= 0 {
            queue.append((move, goal, count + 1, board))
        }
    }
}


func moveLeft(current: (Int, Int)) -> (Int, Int) {
    
    return (current.0 - 1, current.1)
}

func moveRight(current: (Int, Int)) -> (Int, Int) {
    
    return (current.0 + 1, current.1)
}

func moveUp(current: (Int, Int)) -> (Int, Int) {
    
    return (current.0, current.1 - 1)
}

func moveDown(current: (Int, Int)) -> (Int, Int) {
    
    return (current.0, current.1 + 1)
}


func moveCtrlLeft(goalX: Int, currentX: Int, y: Int, board: [[Int]]) -> (Int, Int) {
    
    if goalX >= currentX {
        return (4, 4)
    }
    
    var newX = 0
    
    for x in goalX..<currentX {
        if board[y][x] != 0 {
            newX = x
        }
    }
    
    return (newX, y)
}

func moveCtrlRight(goalX: Int, currentX: Int, y: Int, board: [[Int]]) -> (Int, Int) {
    
    if goalX <= currentX {
        return (4, 4)
    }
    
    for x in currentX + 1...goalX {
        if board[y][x] != 0 {
            return(x, y)
        }
    }
    
    return (3, y)
}

func moveCtrlUp(goalY: Int, currentY: Int, x: Int, board: [[Int]]) -> (Int, Int) {
    
    if goalY >= currentY {
        return (4, 4)
    }
    
    var newY = 0
    
    for y in goalY..<currentY {
        if board[y][x] != 0 {
            newY = y
        }
    }
    
    return (x, newY)
}

func moveCtrlDown(goalY: Int, currentY: Int, x: Int, board: [[Int]]) -> (Int, Int) {
    
    if goalY <= currentY {
        return (4, 4)
    }
    
    for y in currentY + 1...goalY {
        if board[y][x] != 0 {
            return (x, y)
        }
    }
    
    return (x, 3)
}

print(solution([[1,0,0,3],[2,0,0,0],[0,0,0,2],[3,0,1,0]], 1, 0))
