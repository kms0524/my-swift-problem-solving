//
//  main.swift
//  프로그래머스 소수 찾기
//
//  Created by 강민성 on 2021/11/11.
//

import Foundation

func solution(_ numbers:String) -> Int {
    
    var count = 0
    
    let stringArr = numbers.map{ String($0) }
    let permutedArr = comb(digit: numbers.count, numbers: stringArr).compactMap {
        return Int($0)
    }
    
    Set(permutedArr).forEach { number in
        if isPrime(number) {
            count += 1
        }
    }
    return count
}

func isPrime(_ n: Int) -> Bool {
    guard n >= 2     else { return false }
    guard n != 2     else { return true  }
    guard n % 2 != 0 else { return false }
    return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
}

func comb(digit: Int, numbers: [String]) -> Set<String> {
    if digit == 1 {
        return Set(numbers) }
    if digit < 1 { return [] }
    
    var answer: Set<String> = []
    for i in 0..<numbers.count {
        let num = numbers[i]
        var subNumbers: [String] = numbers
        subNumbers.remove(at: i)
        
        
        let subComb = comb(digit: digit-1, numbers: subNumbers)
        let subArray = subComb.compactMap{ num + $0 }
        answer = answer.union(subComb)
        answer = answer.union(Set(subArray))
    }
    
    return answer
}


solution("123")
//permute([0, 1, 3])
