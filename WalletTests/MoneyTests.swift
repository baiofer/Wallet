//
//  MoneyTests.swift
//  Wallet
//
//  Created by Fernando Jarilla on 1/8/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import XCTest
@testable import Wallet

class MoneyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCurrencies() {
        
        XCTAssertEqual("EUR", Money(amount: 5, currency: "EUR").currency)
        XCTAssertEqual("USD", Money(amount: 5, currency: "USD").currency)
    }
    
    func testMultiplicacion() {
        let euro = Money(amount: 5, currency: "EUR")
        let ten = Money(amount: 10, currency: "EUR")
        let total = euro.times(2)
        XCTAssertEqual(total as! Money, ten)
        
        let five1 = Money(amount: 5, currency: "USD")
        let total1 = five1.times(2)
        let ten1 = Money(amount: 10, currency: "USD")
        XCTAssertEqual(ten1, total1 as! Money)
    }
    
    func testEquality() {
        let five = Money(amount: 5, currency: "EUR")
        let ten = Money(amount: 10, currency: "EUR")
        let total = five.times(2)
        XCTAssertEqual(ten, total as! Money)
        XCTAssertFalse(total as! Money == five)
        
        let five1 = Money(amount: 5, currency: "USD")
        let ten1 = Money(amount: 10, currency: "USD")
        let total1 = five1.times(2)
        XCTAssertEqual(ten1, total1 as! Money)
        XCTAssertFalse(total1 as! Money == five1)
    }
    
    func testCustomStringConvertible() {
        let euro = Money(amount: 5, currency: "EUR")
        XCTAssertEqual(euro.description, "EUR, 5")
        
        let dollar = Money(amount: 5, currency: "USD")
        XCTAssertEqual(dollar.description, "USD, 5")
    }
    
    func testHashable() {
        let a = Money(amount: 5, currency: "EUR")
        let b = Money(amount: 5, currency: "EUR")
        XCTAssertEqual(a.hashValue, b.hashValue)
        
        let a1 = Money(amount: 5, currency: "USD")
        let b1 = Money(amount: 5, currency: "USD")
        XCTAssertEqual(a1.hashValue, b1.hashValue)
    }
    
    func testAmountStorage() {
        let euro = Money(amount: 5, currency: "EUR")
        XCTAssertEqual(euro.amount, 5)
        
        let dollar = Money(amount: 5, currency: "USD")
        XCTAssertEqual(dollar.amount, 5)
    }
    
    func testDifferentCurrencies() {
        let euro = Money(amount: 1, currency: "EUR")
        let dollar = Money(amount: 1, currency: "USD")
        XCTAssertNotEqual(euro, dollar)
    }
    
    func testSimpleAddition() {
        
        let simpleAddition = Money(dollarWithAmount: 5).plus(Money(dollarWithAmount: 5)) as! Money
        XCTAssertEqual(simpleAddition, Money(dollarWithAmount: 10))
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
