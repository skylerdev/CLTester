//
//  Hand.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

class Hand {
    var cards: [Card]
    
    init(_ cards: [Card]){
        self.cards = cards
    }
    
    func addcard (_ card: Card){
        cards.append(card)
    }
    
    func sort (){
        cards.sort()
    }
    
}

enum HandRank: Int, CaseIterable {
    case royal = 0, straightflush, quads, fullhouse, flush, straight, trips, twopair, pair, high
}
