//
//  main.swift
//  백준 문자열 제곱
//
//  Created by 강민성 on 2022/08/05.
//

import Foundation

/*
 abcd = abcd^1
 aaaa = a^4
 ababab = ab^3
 */



while true {
    var input = readLine()!
    
    if input == "." {
        break
    }
    
    var str = input.map { String($0) }
    var pi = [Int](repeating: 0, count: str.count)
    
    var i = 1
    var j = 0
    
    while i < str.count {
        while (j > 0 && str[i] != str[j]) {
            j = pi[j - 1]
        }
        
        if str[i] == str[j] {
            j += 1
            pi[i] = j
        }
        i += 1
    }
    
    var result = str.count - pi[str.count - 1]
    
    if str.count % result == 0 {
        print(str.count / result)
    }
    else {
        print(1)
    }
    
}
