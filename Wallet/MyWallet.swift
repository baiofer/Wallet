//
//  MyWallet.swift
//  Wallet
//
//  Created by Fernando Jarilla on 2/8/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import Foundation

final class MyWallet: MoneyProtocol {
    
    typealias Moneys = [Money]
    
    var moneys = Moneys()
    
    init(amount: Int, currency: String) {
        
        let money = Money(amount: amount, currency: currency)
        moneys.append(money)
    }
    
    func times(_ times: Int) -> AnyObject {
 
        var newMoneys = Moneys()
        
        for element in moneys {
            let newMoney = Money(amount: element.amount * times, currency: element.currency)
            newMoneys.append(newMoney)
        }
        return newMoneys as AnyObject
    }
    
    func plus(_ plus: Money) -> AnyObject? {
        
        moneys.append(plus)
        return moneys as AnyObject
    }
    
    func reduceTo(currency: String, withBroker: Broker) -> Money {
        
        var result = Money(amount: 0, currency: currency)
        
        for element in self.moneys {
            result = result.plus(element.reduceTo(currency: currency, withBroker: withBroker)) as! Money
        }
        return result
    }
}

extension MyWallet: Equatable {
    
    static func ==(lhs: MyWallet, rhs: MyWallet) -> Bool {
        return lhs.moneys.first == rhs.moneys.first
    }
}
