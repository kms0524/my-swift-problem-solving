//
//  main.swift
//  프로그래머스 예상 대진표
//
//  Created by 강민성 on 2021/11/14.
//

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 0
    
    var a = a
    var b = b
    
    while a != b {
        
        if a % 2 == 1 {
            a = (a / 2) + 1
        }
        else {
            a /= 2
        }
        
        if b % 2 == 1 {
            b = (b / 2) + 1
        }
        else {
            b /= 2
        }
        
        answer += 1
        
    }
    
    return answer
}
