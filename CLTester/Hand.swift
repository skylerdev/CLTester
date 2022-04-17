//
//  Hand.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

class Hand {
    
    var cards: [Card]
    var handRank: HandRank {
        rankHand()
    }
    
    init(_ cards: [Card]){
        self.cards = cards
    }
    
    func addcard(_ card: Card){
        cards.append(card)
    }
    
    func sort(){
        cards.sort()
    }
    
    private func rankHand() -> HandRank {
        
        let rankcount: Dictionary = cards.reduce(into: [:]) { counts, Card in counts[Card.rank, default: 0] += 1 }
        let suitcount: Dictionary = cards.reduce(into: [:]) { counts, Card in counts[Card.suit, default: 0] += 1 }

        print(suitcount)

        var fs: Suit?
        var besthand = [Card]()


        suitcount.forEach({ (key: Suit, value: Int) in
            fs = value > 4 ? key : fs
        })

        if let flushsuit = fs {
            //Flush
            var flushhand = cards.filter { card in
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
                        return .royalflush
                    } else {
                        print("Straight Flush")
                        return .straightflush

                    }
                }
            }
            

            
            if besthand.isEmpty {
                besthand = Array(flushhand[0...4])
                print("Flush")
                return .flush
            }
            print(besthand)
            
        }

        
        
        return .high
        
    }
    
    
}

enum HandRank: Int, CaseIterable {
    case royalflush = 0, straightflush, quads, fullhouse, flush, straight, trips, twopair, pair, high
}


