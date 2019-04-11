//
//  ViewController.swift
//  Example
//
//  Created by Juan Pablo Fernandez on 4/10/19.
//  Copyright © 2019 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import SwiftyUpgrade
import StoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func handleUpgrade(_ sender: UIButton) {
        SwiftyUpgrade.shared.delegate = self
        SwiftyUpgrade.shared.present(self)
    }
}

extension ViewController: SwiftyUpgradeDelegate {
    
    func userDidTapPurchase(_ product: SKProduct?) {
        print("Tapped Purchase")
    }
    
    func userDidTapCancel() {
        print("Dismissing Screen")
    }
}

