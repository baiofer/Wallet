//
//  SimpleViewControllerTests.swift
//  Wallet
//
//  Created by Fernando Jarilla on 3/8/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import XCTest
@testable import Wallet

class SimpleViewControllerTests: XCTestCase {
    
    var simpleVC: SimpleViewController!
    var button: UIButton!
    var label = UILabel()
    
    var walletVC: WalletTableViewController!
    var wallet: MyWallet!
    
    override func setUp() {
        super.setUp()
        // Creamos el entorno de laboratorio
        simpleVC =  SimpleViewController(nibName: nil, bundle: nil)
        button = UIButton(type: .roundedRect)
        button.titleLabel?.text = "Hola"
        label = UILabel()
        simpleVC.displayLabel = self.label
        
        wallet = MyWallet(amount: 1, currency: "USD")
        wallet.plus(Money(euroWithAmount: 1))
        walletVC = WalletTableViewController(model: wallet)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        simpleVC = nil
        button = nil
    }
    
    //Test de un @IBAction
    func testThatTextOnLabelIsEqualToTestOnButton() {
        simpleVC.displayText(self.button)
        XCTAssertEqual(self.button.titleLabel?.text, self.label.text)
    }

    func testThatTableHasOneSection() {
        
        let sections = walletVC.numberOfSections(in: walletVC.tableView)
        XCTAssertEqual(sections, 1)
    }
    
    func testThatNumberOfCellsIsNumberOfMoneysPlusOne() {
        
    }
 
}
