//
//  main.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

var deck = CardDeck()

var testHand = ExampleHands.flush

print("Testing Flush:")
print(testHand.handRank)
//print(testHand.cards)
print(" ")

testHand = ExampleHands.straightflush

print("Testing StrFlush:")
print(testHand.handRank)
//print(testHand.cards)
print(" ")


testHand = ExampleHands.royalflush

print("Testing RoyFlush:")
print(testHand.handRank)
//print(testHand.cards)
print(" ")


