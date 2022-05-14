//
//  main.swift
//  프로그래머스 가장 큰 수
//
//  Created by 강민성 on 2021/10/30.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    
    let arr = numbers
    var answer = ""
    
    let sortedArr = arr.sorted { Int("\($0)\($1)")! > Int("\($1)\($0)")!}
    
    if sortedArr[0] == 0 {
        return "0"
    }
    
    sortedArr.forEach {
        answer += String($0)
    }
    
    return answer
}
