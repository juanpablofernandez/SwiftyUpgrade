//
//  ViewController.swift
//  Example
//
//  Created by Juan Pablo Fernandez on 4/10/19.
//  Copyright © 2019 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import SwiftyUpgrade

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func handleUpgrade(_ sender: UIButton) {
//        SwiftyUpgrade.upgradeButtonTitle = "Yaaas Biatch"
        SwiftyUpgrade.shared.delegate = self
        SwiftyUpgrade.shared.present(self)
    }
}

extension ViewController: SwiftyUpgradeDelegate {
    
    func userDidTapCancel() {
        print("Dismissing Screen")
    }
    
    func userDidTapPurchase() {
        print("Tapped Purchase")
    }
    
}

