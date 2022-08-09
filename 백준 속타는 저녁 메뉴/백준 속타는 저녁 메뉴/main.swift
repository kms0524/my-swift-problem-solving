//
//  main.swift
//  백준 속타는 저녁 메뉴
//
//  Created by 강민성 on 2022/08/06.
//

import Foundation

var L = Int(readLine()!)!

var target = readLine()!.split(separator: " ").map { String($0) }

var halfStr = readLine()!.split(separator: " ").map { String($0) }
var str = halfStr + halfStr

str.removeLast()


func kmpFail(_ pattern: [String]) -> [Int] {
    
    var patternArr = pattern
    
    var pi = [Int](repeating: 0, count: pattern.count)

    var j = 0
    
    for i in 1..<pattern.count {
        while (j > 0 && patternArr[i] != patternArr[j]) {
            j = pi[j - 1]
        }
        if patternArr[i] == patternArr[j] {
            j += 1
            pi[i] = j
        }
    }
    
    return pi
}

func kmp(_ pi: [Int], _ string: [String], _ pattern: [String]) -> Int {
    
    var count = 0
    
    var j = 0
    
    for i in 0..<string.count {
        while j > 0 && string[i] != pattern[j] {
            j = pi[j - 1]
        }
        
        if string[i] == pattern[j] {
            if j == pattern.count - 1 {
                count += 1
                j = pi[j]
            }
            else {
                j += 1
            }
        }
    }
    
    return count
    
}

func getGCD(_ m: Int, _ n: Int) -> Int {
    let r: Int = m % n
    if r != 0 {
        return getGCD(n, r)
    } else {
        return n
    }
}


var pi = kmpFail(target)
var count = kmp(pi, str, target)

var gcd = getGCD(count, L)

print("\(count / gcd)/\(L / gcd)")

/*
 
 A A B AABA
 
 */
