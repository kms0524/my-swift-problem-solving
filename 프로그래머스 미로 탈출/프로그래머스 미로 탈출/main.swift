//
//  main.swift
//  프로그래머스 미로 탈출
//
//  Created by 강민성 on 2021/07/30.
//


/*
 
 핵심: 트랩을 밟았을때의 경로를 따로 선언해준다
 
 트랩이 켜져있으면(홀수번 횟수로 밟았으면) 트랩과 연결된 경로는 반대가 되고
 트랩이 꺼져이으면 (0, 혹은 짝수번 횟수로 밟았으면) 트랩과 연결된 경로는 원래대로 되돌아온다.
 
 트랩끼리 연결된 간선은?
 [NT] -> [T] <- [T] <- [NT]
 왼쪽부터 진행한다고 가정(편하게 1,2,3,4 라고 부름)
 
 1 -> 2 -> 3 ->4 로 이동가능
 유의해야하는건, 2번과 3번사이의 간선은 두번 상태가 바뀐다
 
 트랩문제를 해결하기위해 비트마스크 사용
 
 비트마스크를 사용해 처음 밟으면 1로 추가,
 트랩이 켜져있으먄 1, 다시 한번 밟아 꺼져있으면 0으로 처리
 
 
 그러면 두개의 그래프에 대해서 다익스트라를 돌리면 되는건가?
 YES, BUT PQ(Priority Queue)를 사용해야한다.
 즉, PQ를 하드코딩해얗난다ㅏㅏㅏㅏㅏㅏㅏㅇㄹㅁㅇ
 
 
 
 */

import Foundation

public struct PriorityQueue<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool

    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }

    var isEmpty: Bool {
        return nodes.isEmpty
    }

    func peek() -> T? {
        return nodes.first
    }

    mutating func enqueue(_ element: T) {
        var index: Int = nodes.count

        nodes.append(element)

        while index > 0, !comparer(nodes[index],nodes[(index - 1) / 2]) {
            nodes.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2
        }
    }

    mutating func dequeue() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }

        if nodes.count == 1 {
            return nodes.removeFirst()
        }

        let result: T? = nodes.first
        nodes.swapAt(0, nodes.count - 1)
        _ = nodes.popLast()

        var index = 0

        while index < nodes.count {
            let left: Int = index * 2 + 1
            let right: Int = left + 1

            if right < nodes.count {
                if comparer(nodes[left], nodes[right]),
                   !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]){
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else {
                break
            }
        }

        return result
    }
}

extension PriorityQueue where T: Comparable {
    init() {
        self.init(comparer: >)
    }
}

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.cost < rhs.cost

    }

    let node: Int   // 현재 방문 노드 index
    let cost: Int   // 시작점부터 현재노드까지 걸린 총 비용
    let trapState: Int
}

func solution(_ n:Int, _ start:Int, _ end:Int, _ roads:[[Int]], _ traps:[Int]) -> Int {
    var graph: [[(v: Int, cost: Int)]] = Array(repeating: [], count: n + 1)
    var inverseGraph: [[(v: Int, cost: Int)]] = Array(repeating: [], count: n + 1)
    var trapIndexDic: [Int: Int] = [:]
    var pq: PriorityQueue<Node> = .init()
    var dist: [[Int]] = Array(repeating: Array(repeating: Int.max, count: 1 << traps.count), count: n + 1)

    for road in roads {
        graph[road[0]].append((v: road[1], cost: road[2]))
        inverseGraph[road[1]].append((v: road[0], cost: road[2]))
    }

    for i in 0...n {
        trapIndexDic[i] = -1
    }

    var trapIndex: Int = 0
    for trap in traps {
        trapIndexDic[trap] = trapIndex
        trapIndex += 1
    }

    pq.enqueue(Node(node: start, cost: 0, trapState: 0))
    dist[start][0] = 0

    while !pq.isEmpty {
        guard let now = pq.dequeue() else {
            return Int.max
            
        }

        if now.node == end {
            return dist[end][now.trapState]
        }

        if dist[now.node][now.trapState] < now.cost {
            continue
        }

        let trapIndex = trapIndexDic[now.node]!

        if trapIndex == -1 || now.trapState & (1 << trapIndex) == 0 {
            // 현재 노드가 트랩이 아니거나, 트랩인데 비활성화되어있는 경우
            for next in graph[now.node] {
                let nextNodeTrapIndex = trapIndexDic[next.v]!
                if nextNodeTrapIndex == -1 {
                    // 다음 노드가 트랩이 아닌 경우
                    if now.cost + next.cost < dist[next.v][now.trapState] {
                        dist[next.v][now.trapState] = now.cost + next.cost
                        pq.enqueue(Node(node: next.v, cost: now.cost + next.cost, trapState: now.trapState))
                    }
                } else {
                    // 다음 노드가 트랩인 경우
                    if now.trapState & (1 << nextNodeTrapIndex) == 0 {
                        // 트랩이 활성화 되어 있지 않은 경우
                        let nextTrapState = now.trapState | (1 << nextNodeTrapIndex)
                        if now.cost + next.cost < dist[next.v][nextTrapState] {
                            dist[next.v][nextTrapState] = now.cost + next.cost
                            pq.enqueue(Node(node: next.v, cost: now.cost + next.cost, trapState: nextTrapState))
                        }
                    } else {
                        // 트랩이 활성화 되어있는 경우
//                        for next2 in inverseGraph[now.node] where next2.v == next.v {
//                            let nextTrapState = now.trapState & ~(1 << nextNodeTrapIndex)
//                            if now.cost + next2.cost < dist[next2.v][nextTrapState] {
//                                dist[next2.v][nextTrapState] = now.cost + next2.cost
//                                pq.enqueue(Node(node: next2.v, cost: now.cost + next2.cost, trapState: nextTrapState))
//                            }
//                        }
                    }
                }
            }

            for next in inverseGraph[now.node] {
                let nextNodeTrapIndex = trapIndexDic[next.v]!
                if nextNodeTrapIndex != -1 && (now.trapState & (1 << nextNodeTrapIndex) > 0) {
                    let nextTrapState = now.trapState & ~(1 << nextNodeTrapIndex)
                    if now.cost + next.cost < dist[next.v][nextTrapState] {
                        dist[next.v][nextTrapState] = now.cost + next.cost
                        pq.enqueue(Node(node: next.v, cost: now.cost + next.cost, trapState: nextTrapState))
                    }
                }
            }
        } else {
            // 현재 노드가 트랩이면서 활성화 되어있는 경우
            for next in graph[now.node] {
                let nextNodeTrapIndex = trapIndexDic[next.v]!
                if nextNodeTrapIndex != -1 {
                    if now.trapState & (1 << nextNodeTrapIndex) > 0 {
                        // 다음 노드가 트랩이면서, 활성화 되어있는 경우
                        let nextTrapState = now.trapState & ~(1 << nextNodeTrapIndex)
                        if now.cost + next.cost < dist[next.v][nextTrapState] {
                            dist[next.v][nextTrapState] = now.cost + next.cost
                            pq.enqueue(Node(node: next.v, cost: now.cost + next.cost, trapState: nextTrapState))
                        }
                    }
                }
            }

            for next in inverseGraph[now.node] {
                let nextNodeTrapIndex = trapIndexDic[next.v]!
                if nextNodeTrapIndex == -1 {
                    // 다음 노드가 트랩이 아닌 경우
                    if now.cost + next.cost < dist[next.v][now.trapState] {
                        dist[next.v][now.trapState] = now.cost + next.cost
                        pq.enqueue(Node(node: next.v, cost: now.cost + next.cost, trapState: now.trapState))
                    }
                } else {
                    // 다음 노드가 트랩인 경우
                    if now.trapState & (1 << nextNodeTrapIndex) == 0 {
                        // 트랩이 활성화 되어 있지 않은 경우
                        let nextTrapState = now.trapState | (1 << nextNodeTrapIndex)
                        if now.cost + next.cost < dist[next.v][nextTrapState] {
                            dist[next.v][nextTrapState] = now.cost + next.cost
                            pq.enqueue(Node(node: next.v, cost: now.cost + next.cost, trapState: nextTrapState))
                        }
                    } else {
                        // 트랩이 활성화 되어있는 경우
//                        for next2 in graph[now.node] where next2.v == next.v {
//                            if now.cost + next2.cost < dist[next2.v] {
//                                dist[next2.v] = now.cost + next2.cost
//                                pq.enqueue(Node(node: next2.v, cost: now.cost + next2.cost, trapState: now.trapState & ~(1 << nextNodeTrapIndex)))
//                            }
//                        }
                    }
                }
            }
        }

    }
    return Int.max
}
