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
print(testHand.getBestHandType())
//print(testHand.cards)
print(" ")
print("Best Hand:")
var bh = testHand.getBestHand()
for card in bh {
    card.printCard()
}
print(" ")

testHand = ExampleHands.straightflush

print("Testing Quads:")
print(testHand.getBestHandType())
//print(testHand.cards)
print(" ")
print("Best Hand:")
bh = testHand.getBestHand()
for card in bh {
    card.printCard()
}
print(" ")


testHand = ExampleHands.royalflush

print("Testing Quads:")
print(testHand.getBestHandType())
//print(testHand.cards)
print(" ")
print("Best Hand:")
bh = testHand.getBestHand()
for card in bh {
    card.printCard()
}
print(" ")

testHand = ExampleHands.quads

print("Testing Quads:")
print(testHand.getBestHandType())
//print(testHand.cards)
print(" ")
print("Best Hand:")
bh = testHand.getBestHand()
for card in bh {
    card.printCard()
}
print(" ")
