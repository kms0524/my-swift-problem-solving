//
//  main.swift
//  백준 연산자 끼워넣기
//
//  Created by 강민성 on 2021/08/25.
//


/*
 
 문제 분류: 백트래킹
 Q: 이문제는 가지치기(Prunning)가 없는데 백트래킹으로 분류 되어 있는데?
 A: 문제해결할때 가지치기를 무조건 해야 백트래킹으로 분류되는것이 아니다.
 백트래킹: 모든 조합을 시도해보는 것이고, 이때 필요한 답을 더 빠르게 구할때
 가지치기가 필요하다면 사용하는것이지, 무조건 가지치기를 사용해야 백트래킹이 아니다!
 https://www.acmicpc.net/board/view/48600
 
 
 */


import Foundation

var N = Int(readLine()!)!

var numbers = readLine()!.split(separator: " ").map{ Int($0)! }
var operators = readLine()!.split(separator: " ").map{ Int($0)! }

var maxAnswer = -Int(1e9)
var minAnswer = Int(1e9)

func dfs(depth: Int, sum: Int) {
    
    if depth == N - 1{
        maxAnswer = max(maxAnswer, sum)
        minAnswer = min(minAnswer, sum)
        return
    }
    
    
    for i in 0..<operators.count {
        
        if operators[i] > 0 {
            operators[i] -= 1
            switch i {
            case 0: dfs(depth: depth + 1, sum: sum + numbers[depth + 1])
            case 1: dfs(depth: depth + 1, sum: sum - numbers[depth + 1])
            case 2: dfs(depth: depth + 1, sum: sum * numbers[depth + 1])
            case 3: dfs(depth: depth + 1, sum: sum / numbers[depth + 1])
            default:
                break
            }
            operators[i] += 1
        }
    }
}

dfs(depth: 0, sum: numbers[0])

print(maxAnswer)
print(minAnswer)
