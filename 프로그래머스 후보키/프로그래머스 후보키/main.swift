//
//  main.swift
//  프로그래머스 후보키
//
//  Created by 강민성 on 2021/09/01.
//
/*
import Foundation

func solution(_ relation:[[String]]) -> Int {
    
    let colCount = relation[0].count
    
    if colCount == 1 {
        return 1
    }
    
    let col = Array<Int>(0..<colCount)
    var candidate = [[Int]]()
    
    for i in 1...colCount {
        candidate += combinations(col, i)
    }
    
    var key = [[Int]]()
    
    for candi in candidate {
        
        let candiSet = Set(candi)
        var state = false
        
        for k in key {
            if candiSet.isSuperset(of: k) {
                state = true
                break
            }
        }
        
        if state == true {
            continue
        }
        
        var result = [[String]]()
        
        for rel in relation {
            var temp = [String]()
            
            for c in candi {
                temp.append(rel[c])
            }
            
            if !result.contains(temp) {
                result.append(temp)
            }
            else {
                break
            }
        }
        if result.count == relation.count {
            key.append(candi)
        }
    }
    
    return key.count
}


func combinations<T>(_ elements: [T], _ k: Int) -> [[T]] {
    
    if elements.count == k { return [elements] }
    
    
    if k == 0 { return [] }
    
    
    if k == 1 { return elements.map {[$0]} }
    
    
    var result = [[T]]()
    
    
    let rest = Array(elements.suffix(from:1))
    
    
    let subcombos = combinations(rest,k-1)
    
    
    result += subcombos.map { [elements[0]] + $0 }
    
    
    result += combinations(rest,k)
    
    return result
}
*/


import Foundation

func solution(_ relation:[[String]]) -> Int {
    let rowSize = relation.count
    let colSize = relation[0].count

    print(rowSize)
    print(colSize)
    print(1<<colSize)
    
    var resultSet = Set<Int>()

    for bit in 1..<(1<<colSize) {
        var combiSet = Set<String>()
        var isUnique = true

        for r in 0..<rowSize {
            var tmpStr = ""
            for c in 0..<colSize where (bit & (1<<c)) != 0 {
                tmpStr += relation[r][c]
            }
            if combiSet.update(with: tmpStr) != nil { // set내에 중복 요소 존재
                isUnique = false
                
            }
        }

        if isUnique && resultSet.filter{ ($0 & bit) == $0 }.isEmpty {
            resultSet.insert(bit)
        }
    }

    return resultSet.count
}

print(solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]))
