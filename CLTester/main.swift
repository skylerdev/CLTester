//
//  main.swift
//  CLTester
//
//  Created by Skyler Devlaming on 2022-04-16.
//

import Foundation

var deck = CardDeck()
let c1 = deck.drawCard()!
let c2 = deck.drawCard()!

c1.printCard()
c2.printCard()

print(c1 < c2)

