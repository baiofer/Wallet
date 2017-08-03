//
//  MyWalletTests.swift
//  Wallet
//
//  Created by Fernando Jarilla on 2/8/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import XCTest
@testable import Wallet

class MyWalletTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEqual() {
        let wallet1 = MyWallet(amount: 10, currency: "EUR")
        let wallet2 = MyWallet(amount: 10, currency: "EUR")
        XCTAssertEqual(wallet1, wallet2)
    }

    // €40 + $20 = $100 (2:1)
    func testAdditionWithReduction() {
        
        let broker = Broker()
        broker.addRate(2, fromCurrency: "EUR", toCurrency: "USD")
        
        let wallet = MyWallet(amount: 40, currency: "EUR")
        wallet.plus(Money(dollarWithAmount: 20)) as AnyObject
        
        let reduced = broker.reduce(wallet: wallet, toCurrency: "USD")
        
        XCTAssertEqual(reduced, Money(dollarWithAmount: 100))
    }
}
