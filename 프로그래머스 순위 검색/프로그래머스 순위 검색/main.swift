//
//  main.swift
//  프로그래머스 순위 검색
//
//  Created by 강민성 on 2021/08/14.
//

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    var answer: [Int] = []
    var dic: [String: [Int]] = [:]
    
    for s in info {
       
        let infoString = s.components(separatedBy: .whitespaces)
        
        let lang = [infoString[0], "-"]
        let backOrFront = [infoString[1], "-"]
        let junOrSen = [infoString[2], "-"]
        let pizOrChick = [infoString[3], "-"]
        let score = Int(infoString[4])!
        
        
        for l in lang {
            for bof in backOrFront {
                for jos in junOrSen {
                    for poc in pizOrChick {
                        let key = "\(l) \(bof) \(jos) \(poc)"
                        if dic.keys.contains(key) {
                            dic[key]?.append(score)
                        }
                        else {
                            dic[key] = [score]
                        }
                    }
                }
            }
        }
    }
    
    for value in dic {
        let sortedValue = value.value.sorted()
        dic[value.key] = sortedValue
    }
    
    query.forEach {
        
        let currentQuery = $0.components(separatedBy: .whitespaces)
        
        let lang = currentQuery[0]
        let bof = currentQuery[2]
        let jos = currentQuery[4]
        let poc = currentQuery[6]
        let score = Int(currentQuery[7])!
        
        let key = "\(lang) \(bof) \(jos) \(poc)"
        if let checkScore = dic[key] {
            var start = 0
            
            var end = checkScore.count
            
            while start < end {
                let mid = (start + end) / 2
                
                if checkScore[mid] >= score {
                    end = mid
                }
                else {
                    start = mid + 1
                }
            }
            answer.append(checkScore.count - start)
        }
        else {
            answer.append(0)
        }
    }
    
    
    return answer
}
