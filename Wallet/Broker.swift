//
//  Broker.swift
//  Wallet
//
//  Created by Fernando Jarilla on 2/8/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import Foundation

final class Broker {
    
    typealias Rates = Dictionary<String, Double>
    
    private var _rates = Rates()
    
    var rates: Rates {
        return _rates
    }
    
    func reduce(money: Money, toCurrency: String) -> Money {
        
        return money.reduceTo(currency: toCurrency, withBroker: self)
    }
    
    func reduce(wallet: MyWallet, toCurrency: String) -> Money {
        
        return wallet.reduceTo(currency: toCurrency, withBroker: self)
    }
    
    func addRate(_ rate: Double, fromCurrency: String, toCurrency: String) {
        
        self._rates[keyFromCurrency(fromCurrency, toCurrency: toCurrency)] = rate
        self._rates[keyFromCurrency(toCurrency, toCurrency: fromCurrency)] = 1/rate
    }
    
    func keyFromCurrency(_ from: String, toCurrency to: String) -> String {
        
        return "\(from) \(to)"
    }
}
