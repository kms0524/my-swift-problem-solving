//
//  main.swift
//  프로그래머스 무지의 먹방 라이브
//
//  Created by 강민성 on 2021/09/05.
//



/*
 
 10 10 7 10 10 / 44
 
 */

func solution(_ food_times:[Int], _ K:Int64) -> Int {
 
    
    guard food_times.reduce(0, +) > K else {
        return -1
    }
    
    
    // 받아온 배열을 시간과 인덱스값을 가진 튜플을 가진 배열형태로 확장
    var food_info: [(time: Int, index: Int)] = food_times.enumerated().map {($1, $0)}
    
    var k = Int(K)
    
    // 배열안 튜플의 시간값을 오름차순 순서대로 정렬
    food_info.sort { $0.0 < $1.0 }
    
    
    var cycle = 0
    var i = 0
    var j = 0
    
    while i < food_info.count {
        j = i
        
        while j < food_info.count && food_info[i].time == food_info[j].time {
            print("i의 시간 \(food_info[i].time)")
            print("j의 시간 \(food_info[j].time)")
            print("============================")

            j += 1
        }
        
        print("i: \(i)")
        print("j: \(j)")
        print("cycle: \(cycle)")
        
        print("============================")
        
        let current = food_info[i].time - cycle
        print("curr: \(current)")
        let count = (food_info.count - i) * current
        print("count: \(count)")
        
        print("============================")

        
        if count > k {
            break
        }
        
        k -= count
        cycle += current
        i = j
    }
    print(i)
    print(food_info)
    
    // 시간순으로 정렬했던 배열을 다시 원래 인덱스 순서대로 재정렬
    food_info = food_info[i..<food_info.endIndex].sorted { $0.index < $1.index }
    
    print(food_info)
    
    k = k % food_info.count
    
    print(k)
    
    return food_info[k].index + 1
}


print(solution([3, 1, 2], 5))
