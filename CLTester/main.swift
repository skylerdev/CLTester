//
//  main.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

var deck = CardDeck()

var testHands = [ExampleHands.royalflush, ExampleHands.straightflush, ExampleHands.flush, ExampleHands.quads]

for hand in testHands {
    print(hand.handName)
    print("Best Hand: \(hand.getBestHandType())")
    let bh = hand.getBestHand()
    for card in bh {
        card.printCard()
    }
    print(" ")
}
