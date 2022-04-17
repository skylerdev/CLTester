//
//  ExampleHands.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

struct ExampleHands {
     static let flush = Hand([
        Card(4, "C"),
        Card(3, "C"),
        Card(6, "C"),
        Card(10, "C"),
        Card(11, "C"),
        Card(13, "C"),
        Card(6, "D"),
    ])
     static let straightflush = Hand([
        Card(3, "C"),
        Card(4, "C"),
        Card(5, "C"),
        Card(14, "C"),
        Card(7, "C"),
        Card(8, "C"),
        Card(2, "C"),
    ])
     static let royalflush = Hand([
        Card(9, "C"),
        Card(10, "C"),
        Card(11, "C"),
        Card(12, "C"),
        Card(13, "C"),
        Card(14, "C"),
        Card(6, "D"),
    ])
    static let quads = Hand([
       Card(9, "C"),
       Card(10, "H"),
       Card(10, "C"),
       Card(10, "S"),
       Card(10, "D"),
       Card(14, "C"),
       Card(14, "D"),
   ])
}
