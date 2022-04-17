//
//  main.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

var deck = CardDeck()
var hand = Hand([deck.drawCard()!, deck.drawCard()!])

for _ in 0...4 {
    hand.addcard()
}

hand.sort()

//for card in hand.cards {
//    card.printCard();
//}




let rankcount: Dictionary = hand.cards.reduce(into: [:]) { counts, Card in counts[Card.rank, default: 0] += 1 }
let suitcount: Dictionary = hand.cards.reduce(into: [:]) { counts, Card in counts[Card.suit, default: 0] += 1 }

print(suitcount)

var flushsuit: Suit?

suitcount.forEach({ (key: Suit, value: Int) in
    flushsuit = value > 4 ? key : nil
})

if flushsuit != nil {
    //Flush
    let flushhand = hand.cards.filter { card in
        return card.suit == flushsuit
    }
    print(flushhand)
}
