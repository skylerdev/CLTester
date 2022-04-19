//
//  main.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

var deck = CardDeck()

var testHands = [ExampleHands.royalflush, ExampleHands.straightflush, ExampleHands.quads, ExampleHands.fullhouse, ExampleHands.flush, ExampleHands.straight, ExampleHands.trips, ExampleHands.twopair, ExampleHands.pair, ExampleHands.highcard, ExampleHands.twopairAce]

//for hand in testHands {
//    print(hand.handName)
//    switch hand.isMyHandBetter(enemyHand: ExampleHands.flush) {
//    case 0:
//        print("Tie")
//    default:
//         print(hand.isMyHandBetter(enemyHand: ExampleHands.flush) > 0);
//    }
//    print("Best Hand: \(hand.getBestHandType())")
//    let bh = hand.getBestHand()
//    for card in bh {
//        card.printCard()
//    }
//    print(" ")
//}

var start = DispatchTime.now() // <<<<<<<<<< Start time
print(ExampleHands.twopairAce.getBestHandType())
print(ExampleHands.twopair.getBestHandType())
print(ExampleHands.twopairAce.isMyHandBetter(enemyHand: ExampleHands.twopair))
var end = DispatchTime.now()   // <<<<<<<<<<   end time

var nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
var timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
print(timeInterval)
