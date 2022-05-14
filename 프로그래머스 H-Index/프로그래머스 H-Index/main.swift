//
//  main.swift
//  프로그래머스 H-Index
//
//  Created by 강민성 on 2021/11/16.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    
    var answer = citations.count
    let arr = citations.sorted(by: >)
    
    for i in 0..<arr.count {
        if i >= arr[i] {
            answer = min(i, answer)
        }
    }
    
    print(answer)
    
    return answer
}

solution([2, 3, 0, 6, 1, 5])
