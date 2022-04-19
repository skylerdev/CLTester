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
    ], handName: "Flush")
     static let straightflush = Hand([
        Card(3, "C"),
        Card(4, "C"),
        Card(5, "C"),
        Card(14, "C"),
        Card(7, "C"),
        Card(8, "C"),
        Card(2, "C"),
    ], handName: "Straight Flush")
     static let royalflush = Hand([
        Card(9, "C"),
        Card(10, "C"),
        Card(11, "C"),
        Card(12, "C"),
        Card(13, "C"),
        Card(14, "C"),
        Card(6, "D"),
    ], handName: "Royal Flush")
    static let quads = Hand([
       Card(9, "C"),
       Card(10, "H"),
       Card(10, "C"),
       Card(10, "S"),
       Card(10, "D"),
       Card(14, "C"),
       Card(14, "D"),
   ], handName: "Quads")
    static let trips = Hand([
       Card(9, "C"),
       Card(12, "H"),
       Card(10, "C"),
       Card(10, "S"),
       Card(10, "D"),
       Card(14, "C"),
       Card(13, "D"),
   ], handName: "Trips")
    static let fullhouse = Hand([
       Card(9, "C"),
       Card(10, "H"),
       Card(10, "C"),
       Card(10, "S"),
       Card(14, "D"),
       Card(14, "C"),
       Card(14, "D"),
   ], handName: "Full House")
    static let straight = Hand([
       Card(9, "C"),
       Card(11, "H"),
       Card(10, "C"),
       Card(12, "S"),
       Card(13, "D"),
       Card(8, "C"),
       Card(7, "D"),
   ], handName: "Straight")
    static let twopair = Hand([
       Card(9, "C"),
       Card(12, "H"),
       Card(12, "C"),
       Card(10, "S"),
       Card(10, "D"),
       Card(14, "C"),
       Card(14, "D"),
   ], handName: "Two Pair")
    static let twopairAce = Hand([
       Card(9, "C"),
       Card(12, "H"),
       Card(5, "C"),
       Card(10, "S"),
       Card(10, "D"),
       Card(14, "C"),
       Card(14, "D"),
   ], handName: "Two Pair Ace")
    static let pair = Hand([
       Card(7, "C"),
       Card(12, "H"),
       Card(2, "C"),
       Card(13, "S"),
       Card(10, "D"),
       Card(14, "C"),
       Card(14, "D"),
   ], handName: "Pair Ace")
    static let highcard = Hand([
       Card(9, "C"),
       Card(8, "H"),
       Card(12, "C"),
       Card(13, "S"),
       Card(11, "D"),
       Card(2, "C"),
       Card(3, "D"),
   ], handName: "High Card")
    
    static let highcardNineHigh = Hand([
       Card(9, "C"),
       Card(8, "H"),
   ], handName: "9 8")
    
    static let highcardTenHigh = Hand([
       Card(10, "C"),
       Card(8, "H"),
   ], handName: "10 8")
    
    static let highcardTenHighPlusNine = Hand([
       Card(10, "C"),
       Card(9, "H"),
   ], handName: "10 9")
}
