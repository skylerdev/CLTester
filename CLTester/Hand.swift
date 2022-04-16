//
//  Hand.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

struct Hand {
    let cards: [Card]
    
    init(cards: [Card]){
        self.cards = cards
    }
    
    
}

enum HandRank: Int, CaseIterable {
    case high = 0, pair, twopair, three, straight, flush, fullhouse, four, straightflush
}
