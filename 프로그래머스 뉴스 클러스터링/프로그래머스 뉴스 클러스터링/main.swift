//
//  main.swift
//  프로그래머스 뉴스 클러스터링
//
//  Created by 강민성 on 2021/07/19.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    
    let newStirng1 = Array(str1.lowercased())
    let newStirng2 = Array(str2.lowercased())
    
    var idx = 0
    
    var array1: Array<String> = []
    var array2: Array<String> = []
    
    var intersection: Array<String> = []
    var union: Array<String> = []
    
    var answer = 0
    
    for _ in newStirng1{
        
        
        if isAlphabet(newStirng1[idx]) &&
            isAlphabet(newStirng1[idx+1]) {
            
            let sum = String(newStirng1[idx]) + String(newStirng1[idx+1])
            
            array1.append(sum)
            idx += 1
            
            if idx == newStirng1.count-1 {
                break
            }
        }
        
        else {
            idx += 1
            if idx == newStirng1.count-1 {
                break
            }
        }
    }
    
    idx = 0
    
    for _ in newStirng2 {
        
        if isAlphabet(newStirng2[idx]) &&
            isAlphabet(newStirng2[idx+1]) {
            
            let sum = String(newStirng2[idx]) + String(newStirng2[idx + 1])
            array2.append(sum)
            idx += 1
            if array1.contains(sum) {
                intersection.append(sum)
                array1.remove(at: array1.firstIndex(of: sum)!)
                array2.remove(at: array2.firstIndex(of: sum)!)
                
            }
            
            if idx == newStirng2.count - 1 {
                break
            }
            
        }
        
        else {
            idx += 1
            if idx == newStirng2.count-1 {
                break
            }
            
        }
    }
    
    
    
    union = array1 + array2 + intersection
    
    if union.count == 0 {
        answer = 65536
    }
    
    else {
        
        let result: Double = (Double(intersection.count) / Double(union.count)) * 65536
        
        
        answer = Int(floor(result))
    }
    
    return answer
}

func isAlphabet(_ char: Character) ->Bool {
    
    return char >= "a" && char <= "z"
}

