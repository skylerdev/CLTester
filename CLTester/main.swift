//
//  main.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

var deck = CardDeck()
var hand = ExampleHands.straightflush


let rankcount: Dictionary = hand.cards.reduce(into: [:]) { counts, Card in counts[Card.rank, default: 0] += 1 }
let suitcount: Dictionary = hand.cards.reduce(into: [:]) { counts, Card in counts[Card.suit, default: 0] += 1 }

print(suitcount)

var fs: Suit?
var besthand = [Card]()


suitcount.forEach({ (key: Suit, value: Int) in
    fs = value > 4 ? key : fs
})

guard let flushsuit = fs else {
    throw Error(
}

if flushsuit != nil {
    //Flush
    var flushhand = hand.cards.filter { card in
        return card.suit == flushsuit
    }
    
    flushhand.sort()
    flushhand.reverse()
    
    if [Card(.ace, flushsuit), Card(.two, flushsuit), Card(.three, flushsuit), Card(.four, flushsuit), Card(.five, flushsuit) ].allSatisfy(flushhand.contains) {
        besthand = Array(flushhand[1...4])
        besthand.append(contentsOf: Array(flushhand[0...4]))
    }
    
    for i in 0..<flushhand.count - 4 {
        if flushhand[i].rank.rawValue == flushhand[i+4].rank.rawValue + 4 {
            besthand = Array(flushhand[i...i+4])
            if flushhand[0].rank.rawValue == 14 {
                print("Royal Flush")
            } else {
                print("Straight Flush")
            }
            break
        }
    }
    

    
    if besthand.isEmpty {
        besthand = Array(flushhand[0...4])
        print("Flush")
    }
    print(besthand)
    
}
