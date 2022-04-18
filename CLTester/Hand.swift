//
//  Hand.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

class Hand {
    
    let handName: String
    // The best hand from cards, determined using rankHand()
    var bestHand: [Card]
    var bestHandType: HandRank
    // Array of cards in the hand
    var cards: [Card]
    // The size of cards last time rankHands() was called
    var lastUpdate: Int
    
    init(_ cards: [Card]){
        self.cards = cards
        self.bestHand = []
        self.bestHandType = .high
        self.lastUpdate = 0
        handName = ""
    }
    
    init(_ cards: [Card], handName: String){
        self.cards = cards
        self.bestHand = []
        self.bestHandType = .high
        self.lastUpdate = 0
        self.handName = handName
    }
    
    // Adds given card to hand
    func addcard(_ card: Card){
        cards.append(card)
    }
    
    // Returns the best set of cards in given hand, and updates if there have been changes to hand
    func getBestHand() -> [Card] {
        if lastUpdate != cards.count {
            rankHand()
            return bestHand
        } else {
            return bestHand
        }
    }
    
    // Returns the type of best hand, and updates if there are changes
    func getBestHandType() -> HandRank {
        if lastUpdate != cards.count {
            rankHand()
            return bestHandType
        } else {
            return bestHandType
        }
    }
    
    // Updates besthandtype and besthand when called on whatever cards are in hand
    private func rankHand() {
        let cards = cards.sorted { card1, card2 in
            return card1.rank.rawValue > card2.rank.rawValue
        }
        // A dictionary of the ranks (two, nine, queen) available in cards, and their frequency
        let rankCount: Dictionary = cards.reduce(into: [:]) { counts, Card in counts[Card.rank, default: 0] += 1 }
        // A dictionary of the suits (clubs, hearts, spades, diamonds) available in cards, and their frequency
        let suitCount: Dictionary = cards.reduce(into: [:]) { counts, Card in counts[Card.suit, default: 0] += 1 }
        
        
        var fs: Suit?
        var bestHand = [Card]()
        
        // FLUSH CHECKER
        // Finds possible flushes by seeing if any 5 or more cards have the same suit,
        // as two flushes is not possible
        suitCount.forEach({ (key: Suit, value: Int) in
            fs = value > 4 ? key : fs
        })
        
        // Checks if there is an assign flushSuit
        if let flushSuit = fs {
            
            
            // FLUSH FILTER
            var flushHand = cards.filter { card in
                // Filters cards based on if they are the "flushsuit", so they're easier to work with
                return card.suit == flushSuit
            }
            
            flushHand.sort()
            flushHand.reverse()
            
            // Checks for Ace 2 3 4 5 scenario. Brute force checks if all five hands are in hand
            if [Card(.ace, flushSuit), Card(.two, flushSuit), Card(.three, flushSuit), Card(.four, flushSuit), Card(.five, flushSuit) ].allSatisfy(flushHand.contains) {
                // reverses the array, then adds to best hand, in effect adding two, three, four, five
                bestHand = Array(flushHand.reversed()[0...3])
                // Flips to maintain standard high-card first order, then adds Ace
                bestHand = bestHand.reversed()
                bestHand.append(flushHand[0])
                bestHandType = .straightflush
            }
            
            // STRAIGHT FLUSHES:
            // Grabs the first flush in sorted order, checks if straight or royal, then steps through first 3 cards
            if rankCount.count >= 5 {
                for i in 0..<flushHand.count - 4 {
                    // Checks if first 5 are sequential (Straight check)
                    if flushHand[i].rank.rawValue == flushHand[i+4].rank.rawValue + 4 {
                        // Checks if the highest rank card is ace, guarenteeing a royal flush
                        if flushHand[0].rank.rawValue == 14 {
                            // ROYAL FLUSH
                            // Takes top 5 cards
                            bestHand = Array(flushHand[i...i+4])
                            bestHandType = .royalflush
                        } else {
                            // STRAIGHT FLUSH
                            // Takes top 5 cards
                            bestHand = Array(flushHand[i...i+4])
                            bestHandType = .straightflush
                        }
                    }
                }
            }
            
            // FLUSH:
            // Returns a basic flush if no other are available
            // Flush is lower than quads and trips, but impossible if a flush is present
            if bestHand.isEmpty {
                // Pulls 5 highest rank cards
                bestHand = Array(flushHand[0...4])
                bestHandType = .flush
            }
            
        } else {
            // This branch means no flush is present
            
            // ranksSorted is a sorted representation of rankCount
            let ranksSorted = rankCount.sorted{ $0.value > $1.value }
            
            // The highest amount of cards of the same rank in ranksSorted
            switch ranksSorted.first?.value {
            //QUADS
            case 4:
                // creates besthand from all cards that are equal to the detected quad
                bestHand = cards.filter({ card in
                    card.rank.rawValue == ranksSorted.first?.key.rawValue ?? 20
                })
                bestHandType = .quads
                break
            // TRIPS OR FULL HOUSE
            case 3:
                // Creates a trips besthand
                bestHand = cards.filter({ card in
                    return card.rank.rawValue == ranksSorted.first?.key.rawValue
                })
                // FULLHOUSE
                // Determines if there is an additional pair not equal to the first trip
                if ranksSorted.dropFirst().first?.value ?? 0 >= 2 {
                    // Adds the next set of matching cards to the besthand
                    bestHand.append(contentsOf: (cards.filter({ card in
                        // compares the second dictionary entries rank with the rank of the card, and the first hand in bestcard
                        return ranksSorted.dropFirst().first?.key.rawValue == card.rank.rawValue && card.rank.rawValue != bestHand[0].rank.rawValue
                    })))
                    // If another trip was added, remove 1
                    if bestHand.count >= 6 {
                        bestHand.removeLast()
                    }
                    // re-sorts bestHand
                    bestHand = bestHand.sorted(by: { card1, card2 in
                        return card1.rank.rawValue > card2.rank.rawValue
                    })
                    bestHandType = .fullhouse
                } else {
                    // TRIPS
                    bestHandType = .trips
                }
                break
            // PAIR OR TWO PAIR
            case 2:
                // Best pair is assigned to besthand
                bestHand = cards.filter({ card in
                    return card.rank.rawValue == ranksSorted.first?.key.rawValue
                })
                // TWOPAIR
                // Same as with fullhouse, checks for additional pair
                if ranksSorted.dropFirst().first?.value ?? 0 == 2 {
                    // Adds additional pair to hand
                    bestHand.append(contentsOf: (cards.filter({ card in
                        return ranksSorted.dropFirst().first?.key.rawValue == card.rank.rawValue && card.rank.rawValue != bestHand[0].rank.rawValue
                    })))
                    bestHandType = .twopair
                } else {
                    bestHandType = .pair
                }
                break
            // HIGH CARD
            default:
                // BestHand is highest ranked card
                bestHand.append(cards.sorted(by: { card1, card2 in
                    return card1.rank.rawValue > card2.rank.rawValue
                }).first!)
                bestHandType = .high
                break
            }
            
            // STRAIGHT
            // Straight is only possible if there are at least 5 distinct cards (by rank)
            if rankCount.count >= 5 {
                
                // As with straighthand, makes a sorted list of cards
                var straightHand = cards
                straightHand.sort { card1, card2 in
                    return card1.rank.rawValue > card2.rank.rawValue
                }
                
                // Similar method as straight flush checker, checks if any straights are possible
                for i in 0..<cards.count - 4 {
                    // Checks if first 5 are sequential (Straight check)
                    if straightHand[i].rank.rawValue == straightHand[i+4].rank.rawValue + 4 {
                            bestHand = Array(straightHand[i...i+4])
                            bestHandType = .straight
                        }
                    }
            }
        }
        
        // Updates the lastUpdate with current count
        lastUpdate = cards.count
        self.bestHand = bestHand
    }
    
    
    
    
}

enum HandRank: Int, CaseIterable {
    case royalflush = 0, straightflush, quads, fullhouse, flush, straight, trips, twopair, pair, high
}
