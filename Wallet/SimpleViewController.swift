//
//  SimpleViewController.swift
//  Wallet
//
//  Created by Fernando Jarilla on 3/8/17.
//  Copyright © 2017 Jarzasa. All rights reserved.
//

import UIKit

class SimpleViewController: UIViewController {

    @IBAction func displayText(_ sender: UIButton) {
        
        self.displayLabel.text = sender.titleLabel?.text
    }
    @IBOutlet weak var displayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
