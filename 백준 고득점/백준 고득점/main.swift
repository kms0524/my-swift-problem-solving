//
//  main.swift
//  백준 고득점
//
//  Created by 강민성 on 2021/07/19.
//

import Foundation

var caseNum = Int(readLine()!)!

for _ in 0..<caseNum {
    
    var array: [Int] = []
    var answer = 0
    array.append(0)
    
    let readline = readLine()!
    
    for i in 0..<readline.count {
        let char = readline[readline.index(readline.startIndex, offsetBy: i)]
        let asciiIn8 = char.asciiValue
        let ascii: Int = Int(asciiIn8!)
        answer += min(ascii - 65, 90 - ascii + 1)
        
        if char != "A" {
            array.append(i)
        }
    }
    
    array.append(readline.count)
    
    var minimum = Int.max
    
    for i in 0..<array.count {
        
        if i == array.count - 1 {
            break
        }
        
        let left = array[i] * 2 + readline.count - array[i + 1]
        
        let right = array[i] + (2 * (readline.count-array[i + 1]))
        
        var temp = 0
        
        temp = min(left, right)
        minimum = min(minimum, temp)
    }
    
    answer += minimum
    print(answer)
}
 

