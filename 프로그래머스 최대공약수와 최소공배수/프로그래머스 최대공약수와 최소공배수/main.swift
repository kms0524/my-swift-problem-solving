//
//  main.swift
//  프로그래머스 최대공약수와 최소공배수
//
//  Created by 강민성 on 2021/10/30.
//

import Foundation

func solution(_ n:Int, _ m:Int) -> [Int] {
    
    
    return [gcd(n: n, m: m), n * m / gcd(n: n, m: m)]
}

func gcd(n: Int, m: Int) -> Int {
    
    if m == 0 {
        return n
    }
    else {
        return gcd(n: m, m: n % m)
    }
    
}
