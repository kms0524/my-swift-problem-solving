//
//  main.swift
//  프로그래머스 거리두기 확인하기
//
//  Created by 강민성 on 2021/07/25.
//

/*
 
 주어진 2차원 배열을 3차원 배열로 전환하여 문제를 풀면된다.
 유사문제 : https://www.acmicpc.net/problem/7569
 유의할점은 탐색 시작을 좌측 최상단부터 시작하여 P를 찾을때까지 첫번째로 시작하므로,
 dx와 dy의 방향은 맨해튼 거리에 따라
 우측 1칸, 우측 2칸, 하단 1칸, 하단 2칸, 우측 대각선 1칸, 좌측 대각선 1칸 방향으로
 설정하여 DFS(BFS)를 진행해야한다.
 
 */

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    
    var answer: [Int] = []
    
    let dx = [1, 2, 0, 0, 1, -1]
    let dy = [0, 0, 1, 2, 1, 1]
    let map = places.map {$0.map{$0.map{String($0)}}}
    
    for i in 0..<5 {
        var check = true
        for j in 0..<5 {
            for k in 0..<5 {
                if map[i][j][k] == "P" {
                    for l in 0..<dx.count{
                        let xx = j + dx[l]
                        let yy = k + dy[l]
                        if (0..<5).contains(xx) && (0..<5).contains(yy) && map[i][xx][yy] == "P" {
                            
                            if j == xx {
                                if map[i][j][k+1] != "X" {
                                    check = false
                                }
                            }
                            else if k == yy {
                                if map[i][j+1][k] != "X" {
                                    check = false
                                }
                            }
                            
                            else {
                                if j > xx {
                                    if map[i][j-1][k] != "X"
                                        || map[i][j][k+1] != "X" {
                                     check = false
                                    }
                                }
                                
                                else {
                                    if map[i][j+1][k] != "X" || map[i][j][k+1] != "X" {
                                        check = false
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        if check == true {
            answer.append(1)
        }
        else {
            answer.append(0)
        }
    }
    
    
    return answer
}
