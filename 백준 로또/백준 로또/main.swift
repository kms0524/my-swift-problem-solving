//
//  main.swift
//  백준 로또
//
//  Created by 강민성 on 2021/08/27.
//

import Foundation

while true{
    
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    
    if input[0] == 0 {
        break
    }
    let arr = Array(input.dropFirst(1))
    
    func getCombination<T>(elements: Array<T>, select: Int, repetition: Bool) -> [[T]] {
        guard select > 0 else {
            return [[]]
        }
        
        guard let firstElement = elements.first else {
            return []
        }
        
        let head = [firstElement]
        let subCombination = getCombination(elements: repetition ? elements :  Array(elements.dropFirst()), select: select - 1, repetition: repetition)
        
        var combination = subCombination.map { $0 + head }
        combination += getCombination(elements: Array(elements.dropFirst()), select: select, repetition: repetition)
        
        
        return combination
    }
    
    var sol = getCombination(elements: arr, select: 6, repetition: false)
    
    var answer = ""
    for i in 0..<sol.count {
        sol[i].sort()
        
        for j in 0..<6 {
            answer.append(String(sol[i][j]) + " ")
        }
        
        print(answer)
        answer = ""
    }
    
    print("")
}
