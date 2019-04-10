//
//  SwiftyUpgrade.swift
//  SwiftyUpgrade
//
//  Created by Juan Pablo Fernandez on 4/10/19.
//  Copyright © 2019 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import StoreKit

public protocol SwiftyUpgradeDelegate {
    func userDidTapCancel()
    func userDidTapPurchase(_ product: SKProduct?)
}

public class SwiftyUpgrade {
    
    static public let shared: SwiftyUpgrade = SwiftyUpgrade()
    
    public var delegate: SwiftyUpgradeDelegate?
    private var viewController = SwiftyUpgradeViewController()
    
    public func present(_ sender: UIViewController) {
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = .crossDissolve
        sender.present(viewController, animated: true, completion: nil)
    }
    
    public func dismiss() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
