//
//  main.swift
//  백준 별 찍기 - 10
//
//  Created by 강민성 on 2022/04/26.
//

import Foundation

var N = Int(readLine()!)!

func soltion(_ num : Int, _ stars: [String]) {
    if num == 1 {
        stars.forEach {
            print($0)
        }
        return
    }
    
    var star1: [String] = stars.map { $0 + $0 + $0 }
    var star2: [String] = stars.map { $0 + String(repeating: " ", count: $0.count) + $0 }
    
    var newStars = star1 + star2 + star1
    
    soltion(num / 3, newStars)
}

soltion(N, ["*"])
