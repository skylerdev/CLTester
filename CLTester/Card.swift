//
//  Card.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

enum Suit: String, CaseIterable {
    
    case Hearts = "H"
    case Spades = "S"
    case Clubs = "C"
    case Diamonds = "D"
}

enum Rank: Int, CaseIterable {
    //ace is at the end cause its always high card
    //i.e. until ace needs to fill a 2 straight, its always the best
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
}

struct Card: Comparable, Equatable, Hashable {

    var rank: Rank
    var suit: Suit
    
    init(value: Rank, suit: Suit)
    {
        self.rank = value
        self.suit = suit
    }
    
    init(_ v: Int, _ s: String){
        suit = Suit(rawValue: s)!
        rank = Rank(rawValue: v)!
    }
    
    func printCard() {
        print("\(rank) of \(suit).")
    }
    
    // == operator
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank
        }
    
    // < operator
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rawValue < rhs.rank.rawValue
    }
    
}

class CardDeck {
    
    var deck: [Card]
    var cardsLeft: Int {
        return deck.count
    }
    
    init() {
        deck = []
        createDeck()
        shuffleDeck()
    }
    
    func createDeck() {
        for suit in Suit.allCases {
            for value in Rank.allCases {
                deck.append(Card(value: value, suit: suit))
            }
        }
    }
    
    func listDeck() {
        
        var count = 0
        
        for card in deck {
        print(card)
        count += 1
        }
        print(count)
    }
    
    func shuffleDeck() {
        
        deck.shuffle()
        
    }
    
    func drawCard() -> Card? {
        return deck.popLast()
    }
}


