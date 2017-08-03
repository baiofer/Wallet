//
//  WalletTableViewController.swift
//  Wallet
//
//  Created by Fernando Jarilla on 3/8/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

class WalletTableViewController: UITableViewController {

    let model: MyWallet!
    
    init(model: MyWallet!) {
        self.model = model
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
