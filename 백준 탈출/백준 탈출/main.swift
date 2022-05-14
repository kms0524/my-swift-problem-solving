//
//  main.swift
//  백준 탈출
//
//  Created by 강민성 on 2021/07/23.
//

import Foundation

struct Queue<T> {
    var list: [T]
    var from = 0
    var to = 0
    
    func size() -> Int {
        return to - from
    }
    
    func isEmpty() -> Bool {
        return size() == 0 ? true : false
    }
    
    mutating func push(_ element: T) {
        to += 1
        list.append(element)
    }
    
    mutating func pop() -> T? {
        if isEmpty() {
            return nil
        }
        else {
            let target = list[from]
            from += 1
            return target
        }
    }
    
}

var input = readLine()!.split(separator: " ").map{ Int($0)! }

var R = input[0]
var C = input[1]


