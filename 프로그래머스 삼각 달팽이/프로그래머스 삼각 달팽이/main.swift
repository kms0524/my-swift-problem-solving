//
//  main.swift
//  프로그래머스 삼각 달팽이
//
//  Created by 강민성 on 2021/11/19.
//

/*
 
  n = 2
    1
   2 3
   
  n = 3
    1
   2 6
  3 4 5
 
  n = 4
    1
   2 9
  3 10 8
 4 5 6 7
 
 n =7
             1
           2   18
         3   19   17
       4   20   27  16
     5   21  28   26  15
   6  22   23   24   25  14
 7   8   9   10   11   12   13

 
 [1]
 [2, 15]
 [3, 16, 14]
 [4, 17, 21, 13]
 [5, 18, 19, 20, 12]
 [6,  7,  8,  9, 10, 11]
 
 
 
 [1]
 [2, 18]
 [3, 19, 17]
 [4, 20, 27, 16]
 [5, 21, 28, 26, 15]
 [6, 22, 23, 24, 25, 14]
 [7,  8,  9, 10, 11, 12, 13]
 
 
 
 n = 3 이상부터
 2번째 줄 오른쪽 칸에 위치한 숫자는 n * 2 + (n-3)
 3번째 줄 가운데 칸에 위치한 숫자는 왼쪽 + 오른쪽 - 1
 4번째 줄 가운데에 위치한 칸들 중 왼쪽 칸에 위차한 숫자는 맨 왼쪽 + 오른쪽
 4번째 줄 가운데에 위치한 칸들 중 오른쪽 칸에 위차한 숫자는 맨 왼쪽 + 오른쪽
 
 ˜
 */

import Foundation

func solution(_ n:Int) -> [Int] {
    
    var arr = [[Int]]()
    var n = n
    for i in 0..<n {
        arr.append([Int](repeating: 0, count: i + 1))
    }
    var current = 1
    
    var row = -1
    var col = 0
    while n > 0 {
        for _ in 0..<n {
            row += 1
            arr[row][col] = current
            current += 1
        }
        
//        print("아래 \(arr)")
        
        if n - 1 <= 0 {
            break
        }
        
        for _ in 0..<n - 1 {
            col += 1
            arr[row][col] = current
            current += 1
        }
        
//        print("오른쪽 \(arr)")
        
        if n - 2 <= 0 {
            break
        }
        
        for _ in 0..<n - 2 {
            row -= 1
            col -= 1
            arr[row][col] = current
            current += 1
        }
//        print("위 \(arr)")
        n -= 3
    }
    
    
    let answer = arr.flatMap { $0 }
    
    print(answer)
    
    return answer
    
}

solution(20)
