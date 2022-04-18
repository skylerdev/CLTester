//
//  Hand.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

class Hand {
    
    let handName: String
    var besthand: [Card]
    var besthandtype: HandRank
    var cards: [Card]
    var lastUpdate: Int
    
    init(_ cards: [Card]){
        self.cards = cards
        self.besthand = []
        self.besthandtype = .high
        self.lastUpdate = 0
        handName = ""
    }
    
    init(_ cards: [Card], handName: String){
        self.cards = cards
        self.besthand = []
        self.besthandtype = .high
        self.lastUpdate = 0
        self.handName = handName
    }
    
    func addcard(_ card: Card){
        cards.append(card)
    }
    
    func sort(){
        cards.sort()
    }
    
    func getBestHand() -> [Card] {
        if lastUpdate != cards.count {
            rankHand()
            return besthand
        } else {
            return besthand
        }
    }
    
    func getBestHandType() -> HandRank {
        if lastUpdate != cards.count {
            rankHand()
            return besthandtype
        } else {
            return besthandtype
        }
    }
    
    private func rankHand() {
        
        let rankcount: Dictionary = cards.reduce(into: [:]) { counts, Card in counts[Card.rank, default: 0] += 1 }
        let suitcount: Dictionary = cards.reduce(into: [:]) { counts, Card in counts[Card.suit, default: 0] += 1 }


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
            
            //Checks for Ace 2 3 4 5 scenario
            if [Card(.ace, flushsuit), Card(.two, flushsuit), Card(.three, flushsuit), Card(.four, flushsuit), Card(.five, flushsuit) ].allSatisfy(flushhand.contains) {
                besthand = Array(flushhand.reversed()[0...3])
                besthand = besthand.reversed()
                besthand.append(flushhand[0])
                besthandtype = .straightflush
            }
            
            //grabs the first flush in sorted order, checks if straight or royal
        outerLoop: for i in 0..<flushhand.count - 4 {
                if flushhand[i].rank.rawValue == flushhand[i+4].rank.rawValue + 4 {
                    if flushhand[0].rank.rawValue == 14 {
                        besthand = Array(flushhand[i...i+4])
                        besthandtype = .royalflush
                    } else {
                        besthand = Array(flushhand[i...i+4])
                        besthandtype = .straightflush
                    }
                }
            }
            

            // basic flush
            if besthand.isEmpty {
                besthand = Array(flushhand[0...4])
                besthandtype = .flush
            }
            
        } else {
            let rankcount = rankcount.sorted{ $0.value > $1.value }
            switch rankcount.first?.value {
            case 4:
                besthand = cards.filter({ card in
                    card.rank.rawValue == rankcount.first?.key.rawValue
                })
                besthandtype = .quads
                break
            case 3:
                besthand = cards.filter({ card in
                    card.rank.rawValue == rankcount.first?.key.rawValue
                })
            default:
                print("oh god oh fuck")
            }
        }

        
        lastUpdate = cards.count
        self.besthand = besthand
    }
    
    
    
    
}

enum HandRank: Int, CaseIterable {
    case royalflush = 0, straightflush, quads, fullhouse, flush, straight, trips, twopair, pair, high
}


/*
 is besthand.count == 5
     royal flush = push
     straightflush = highest top card
     fullhouse = highest trip
     flush = highest card downwards
     straight = highest card
 */

/*
 quads = highest card, then kicker
 trips = highest card, then kicker
 twopair = highest, then kicker
 pair = highest, then kicker
 high = kicker
 */
