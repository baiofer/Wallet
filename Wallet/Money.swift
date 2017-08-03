//
//  Money1.swift
//  Wallet
//
//  Created by Fernando Jarilla on 1/8/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import Foundation

protocol MoneyProtocol {
    
    init(amount: Int, currency: String)
    func times(_ times: Int) -> AnyObject
    func plus(_ plus: Money) -> AnyObject?
    func reduceTo(currency: String, withBroker: Broker) -> Money
}

class Money: MoneyProtocol {
    
    private var _amount : Int
    var currency: String
    
    required init(amount: Int, currency: String) {
        _amount = amount
        self.currency = currency
    }
    
    convenience init(dollarWithAmount: Int) {
        self.init(amount: dollarWithAmount, currency: "USD")
    }
    
    convenience init(euroWithAmount: Int) {
        self.init(amount: euroWithAmount, currency: "EUR")
    }
    
    var amount: Int {
        return _amount
    }
}

extension Money {
    
    func times(_ times: Int) -> AnyObject {
        
        let newMoney = Money(amount: self.amount * times, currency: self.currency)
        return newMoney
    }
}

extension Money {
    
    func plus(_ plus: Money) -> AnyObject? {
        
        if self.currency == plus.currency {
            let suma: Int = self.amount + plus.amount
            return Money(amount: suma, currency: plus.currency)
        } else {
            return nil
        }
    }
}

extension Money {
    func reduceTo(currency: String, withBroker: Broker) -> Money {
        
        //Comprobamos que divisa de origen y destino son las mismas
        if self.currency == currency {
            return self
        }
        var rate = withBroker.rates[withBroker.keyFromCurrency(self.currency, toCurrency: currency)]
        if rate == nil {
            //No hay tasa de conversión. Mando una excepción
            rate = 1
        }
        let newAmount = Double(self.amount) * rate!
        let newMoney = Money(amount: Int(newAmount), currency: currency)
        return newMoney
    }
}

extension Money {
    
    var proxyForComparision: String {
        return "\(amount) \(currency)"
    }
}

extension Money: Equatable {
    
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return lhs.proxyForComparision == rhs.proxyForComparision
    }
}

extension Money: Comparable {
    
    static func <(lhs: Money, rhs: Money) -> Bool {
        return lhs.proxyForComparision < rhs.proxyForComparision
    }
}

extension Money: CustomStringConvertible {
    
    public var description: String {
        
        return "\(currency), \(amount)"
    }
}

extension Money: Hashable {
    
    public var hashValue: Int {
        
        return proxyForComparision.hashValue
    }
}





