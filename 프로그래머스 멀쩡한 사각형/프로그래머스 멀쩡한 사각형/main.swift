//
//  main.swift
//  프로그래머스 멀쩡한 사각형
//
//  Created by 강민성 on 2021/11/07.
//

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    let gcd = GCD(w, h)
    
    return Int64((w * h) - (w + h + gcd))
}


func GCD(_ min: Int, _ max: Int) -> Int {
    let remain = min % max
    if remain == 0 {
        return max
    }
    else {
        return GCD(max, remain)
    }
}
