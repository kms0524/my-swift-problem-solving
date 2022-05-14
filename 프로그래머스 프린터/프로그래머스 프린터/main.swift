//
//  main.swift
//  프로그래머스 프린터
//
//  Created by 강민성 on 2021/11/07.
//



func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priority: [(Int,Int)] = priorities.enumerated().map {($0.offset, $0.element)}
    
    print(priorities.enumerated())
    
    print(priority)
    var printing: Int = 0

    while true {
        let pri: (Int, Int) = priority.remove(at: 0)
        print(pri)
        if !priority.filter({pri.1 < $0.1}).isEmpty {
            priority.append(pri)
        } else if pri.0 == location {
            printing = priorities.count - priority.count
            break
        }
    }

    return printing
}



//import Foundation
//
///*
//
// 2 1 3 2 / 2 / 0
// 1 3 2 2 / 1 / 1
// 3 2 2 1 / 0 / 2
//
// 1 1 9 1 1 1 / 0 / 0
// 1 9 1 1 1 1 / 5 / 1
// 9 1 1 1 1 1 / 4 / 2
// 1 1 1 1 1/ 3 / 3
// 1 1 1 1 / 2 / 4
// 1 1 1 / 1 / 5
// 1 1 / 0 / 6
//
// */
//
//func solution(_ priorities:[Int], _ location:Int) -> Int {
//
//    var pq = priorities.sorted(by: >)
//
//    var queue: [(Int, Int)] = []
//
//    var count = 0
//
//    priorities.enumerated().forEach { (index, property) in
//        queue.append((index, property))
//    }
//
//    while !queue.isEmpty {
//
//        if queue.first!.1 == pq.first! {
//
//            if queue.first!.0 == location {
//                count += 1
//                break
//            }
//
//            count += 1
//            pq.removeFirst()
//            queue.removeFirst()
//        }
//        else {
//            queue.append((queue.first!))
//            queue.removeFirst()
//        }
//
//    }
//    return count
//}

solution([2, 1, 3, 2], 2)

