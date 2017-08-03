//
//  BrokerTests.swift
//  Wallet
//
//  Created by Fernando Jarilla on 2/8/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import XCTest
@testable import Wallet

class BrokerTests: XCTestCase {
    
    var broker: Broker!
    var dollar: Money!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        broker = Broker()
        dollar = Money(dollarWithAmount: 1)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSimpleReduction() {
        let sum = Money(dollarWithAmount: 5).plus(Money(dollarWithAmount: 5)) as! Money
        let reduced = broker.reduce(money: sum, toCurrency: "USD")
        XCTAssertEqual(sum, reduced )
    }
    
    //10$ == 5€ , 2:1
    func testReduction() {
        broker.addRate(2, fromCurrency: "USD", toCurrency: "EUR")
        
        let dollars = Money(dollarWithAmount: 5)
        let euros = Money(euroWithAmount: 10)
        let converted = broker.reduce(money: dollars, toCurrency: "EUR")
        XCTAssertEqual(converted, euros)
        
        let dollars1 = Money(dollarWithAmount: 5)
        let euros1 = Money(euroWithAmount: 10)
        let converted1 = broker.reduce(money: euros1, toCurrency: "USD")
        XCTAssertEqual(converted1, dollars1)
    }
    
    //func testThatNotRateRaisesException() {
        //XCTAssertThrowsError(broker.reduce(money: dollar, toCurrency: "EUR"))
    //}
    
    func testThatNilConversionDoesNotChangeMoney() {
        let reduced = broker.reduce(money: dollar, toCurrency: "USD")
        XCTAssertEqual(dollar, reduced)
    }
    
    
    
    
}
