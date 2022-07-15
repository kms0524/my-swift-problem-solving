//
//  main.swift
//  백준 열쇠
//
//  Created by 강민성 on 2022/06/25.
//

import Foundation

//var TC = Int(readLine()!)!
//
//var dx = [1, -1, 0, 0]
//var dy = [0, 0, 1, -1]
//
//func keysToDoor(_ key: String) -> String {
//    var ascii = Int(UnicodeScalar(key)!.value) - 32
//    var door = String(UnicodeScalar(ascii)!)
//
//    return door
//}
//
//for i in 0..<TC {
//
//    var count = 0
//
//    var hw = readLine()!.split(separator: " ").map { Int($0)! }
//
//    var h = hw[0]
//    var w = hw[1]
//
//    var map = [[String]](repeating: [String](repeating: ".", count: w  + 2), count: h + 2)
//    var visited = [[Bool]](repeating: [Bool](repeating: false, count: w + 2), count: h + 2)
//
//    for i in 0..<h {
//        var input = readLine()!.map { String($0) }
//        for j in 1..<w + 1 {
//            map[i + 1][j] = input[j-1]
//        }
//    }
//    var allKeys = [Bool](repeating: false, count: 26)
//    var containKeys = readLine()!.map { String($0) }
//    var closedDoor = [(Int, Int)]()
//
//    // 문이 여러개 -> 인덱스 = 알파벳, 원소는 튜플로 이뤄진 여러개
//
//    if containKeys[0] != "0" {
//        for i in 0..<containKeys.count {
//            var key = containKeys[i]
//            var index = Int(UnicodeScalar(key)!.value) - 97
//            allKeys[index] = true
//            var door = keysToDoor(key)
//            for i in 0..<h {
//                for j in 0..<w {
//                    if map[i][j] == key || map[i][j] == door{
//                        map[i][j] = "."
//                    }
//                }
//            }
//        }
//    }
//
//    func bfs() {
//
//        visited[0][0] = true
//
//        var queue = [(Int, Int)]()
//        queue.append((0, 0))
//
//        while !queue.isEmpty {
//            var current = queue.removeFirst()
//            var x = current.0
//            var y = current.1
//
//            for i in 0..<4 {
//                var xx = x + dx[i]
//                var yy = y + dy[i]
//
//                if (xx < 0 || yy < 0 || xx >= h + 2 || yy >= w + 2) {
//                    continue
//                }
//
//                if map[xx][yy] == "*" || visited[xx][yy] {
//                    continue
//                }
//
//                if map[xx][yy] >= "a" && map[xx][yy] <= "z" {
//                    var index = Int(UnicodeScalar(map[xx][yy])!.value) - 97
//                    allKeys[index] = true
//                    visited[xx][yy] = true
//
//                    queue.append((xx, yy))
//
//                    if closedDoor.isEmpty {
//                        continue
//                    }
//                    else {
//                        while !closedDoor.isEmpty {
//
//                            for j in 0..<25 {
//                                for k in 0..<closedDoor.count {
//                                    var closedX = closedDoor[k].0
//                                    var closedY = closedDoor[k].1
//                                    if allKeys[j] && map[closedX][closedY] == String(UnicodeScalar(j + 65)!.value)  {
//
//                                    var closed = closedDoor[k]
//                                        var tempArr = closedDoor.filter {
//                                            $0.0 != closedX
//                                        }
//
//                                    var doorX = closed.0
//                                    var doorY = closed.1
//
//                                    map[doorX][doorY] = "."
//                                    visited[doorX][doorY] = true
//                                    queue.append((doorX, doorY))
//                                }
//                                if closedDoor.isEmpty {
//                                    break
//                                }
//                                }
//                            }
//                        }
//                    }
//                }
//
//                else if map[xx][yy] >= "A" && map[xx][yy] <= "Z" {
//                    var index = Int(UnicodeScalar(map[xx][yy])!.value) - 65
//                    if allKeys[index] {
//                        map[xx][yy] = "."
//                        visited[xx][yy] = true
//                        queue.append((xx, yy))
//                    }
//                    else {
////                        print("😝😝😝")
////                        print(xx)
////                        print(yy)
//                        closedDoor.append((xx, yy))
//                    }
//                }
//                else if map[xx][yy] == "$" {
//                    count += 1
//                    visited[xx][yy] = true
//                    queue.append((xx, yy))
//                }
//                else {
//                    visited[xx][yy] = true
//                    queue.append((xx, yy))
//                }
//            }
//        }
//    }
//    bfs()
//    print("답 = \(count)")
//}

/*
 1
 7 7
 *ABCDE*
 X.....F
 W.$$$.G
 V.$$$.H
 U.$$$.J
 T.....K
 *SQPML*
 irony
 */

let T = Int(readLine()!)!
for _ in 0..<T {
    let inp = readLine()!.split(separator: " " ).map{Int(String($0))!}
    let row = inp[0], col = inp[1]
    
    var arr = [[Character]]()
    for _ in 0..<row {
        let q: [Character] = Array(readLine()!)
        arr.append(q)
    }
    var keys: [Character] = Array(readLine()!)
    if keys.first! == "0" { keys.removeAll()}
    var dict = (0..<26).reduce(into: [:], {$0[$1,default:false]=false} )
    keys.forEach{
        dict[Int($0.asciiValue!)-97] = true
    }

    let dir = [(0,1),(0,-1),(1,0),(-1,0)]
    var visit = Array(repeating: Array(repeating: false, count: col), count: row)
    var doors = [(Int,Int)]()
    var ans = 0
    
    func bfs(_ start: (Int,Int)) {
        var queue = [start]
        var q = 0
        while queue.count > q {
            let f = queue[q]
            q += 1
            for k in 0..<4 {
                let n = (f.0+dir[k].0, f.1+dir[k].1)
                if n.0>=row||n.1>=col||n.0<0||n.1<0{continue}
                if !visit[n.0][n.1] && arr[n.0][n.1] != "*" {
                    if arr[n.0][n.1] == "$" {
                        ans += 1
                    }
                    if arr[n.0][n.1].isUppercase {
                        let idx = Int(arr[n.0][n.1].asciiValue!)-65
                        if dict[idx]! {
                            visit[n.0][n.1] = true
                            queue.append((n))
                        } else {
                            doors.append((n.0,n.1))
                        }
                    } else {
                        visit[n.0][n.1] = true
                        queue.append(n)
                        if arr[n.0][n.1].isLowercase {
                            let idx = Int(arr[n.0][n.1].asciiValue!)-97
                            dict[idx] = true
                        }
                    }
                }
            }
        }
    }
    
    func roundCheck(_ i:Int, _ j: Int ) {
        if !visit[i][j] && (arr[i][j] == "." || (arr[i][j].isUppercase && dict[Int(arr[i][j].asciiValue!)-65]! ) || arr[i][j] == "$" || arr[i][j].isLowercase ) {
            if arr[i][j] == "$" { ans += 1}
            if arr[i][j].isLowercase { dict[Int(arr[i][j].asciiValue!)-97] = true }
            visit[i][j] = true
            bfs((i,j))
        } else if arr[i][j].isUppercase {
            doors.append((i,j))
        }
    }
    
    for j in 0..<col {
        for i in [0,row-1] {
            roundCheck(i, j)
        }
    }
    for i in 0..<row {
        for j in [0,col-1] {
            roundCheck(i, j)
        }
    }
    
    while true {
        var isChanged = false
        for i in (0..<doors.count).reversed() {
            let door = doors[i]
            let idx = Int(arr[door.0][door.1].asciiValue!)-65
            if dict[idx]! && !visit[door.0][door.1]{
                visit[door.0][door.1] = true
                bfs((door.0,door.1))
                isChanged = true
                doors.remove(at: i)
            }
        }
        if !isChanged { break }
    }
    print(ans)
}


