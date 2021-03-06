//
//  Constants.swift
//  SwiftyUpgrade
//
//  Created by Juan Pablo Fernandez on 4/10/19.
//  Copyright © 2019 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import StoreKit

public extension SwiftyUpgrade {
    
//    static var mainBackgroundColor: UIColor = UIColor("3897F1")
//    static var secondaryBackgroundColor: UIColor = .white
//    static var mainFontColor: UIColor = .white
//    static var secondaryFontColor: UIColor = UIColor("ACB1BC")
    
    
    // MARK: - SwiftyUpgradeViewController
    
    static var upgradeButtonBackgroundColor: UIColor = UIColor("3897F1")
    static var upgradeButtonTitle: String = "TRY 7 DAYS FOR FREE"
    static var upgradeButtonTextColor: UIColor = .white
    static var upgradeButtonFont: UIFont = .systemFont(ofSize: 15, weight: .bold)
    
    static var cancelButtonTitle: String = "NO, THANKS"
    static var cancelButtonBackgroundColor: UIColor = .clear
    static var cancelButtonTextColor: UIColor = UIColor("ACB1BC")
    static var cancelButtonFont: UIFont = .systemFont(ofSize: 15, weight: .bold)
    
    static var upgradeInfoFont: UIFont = .systemFont(ofSize: 12, weight: .regular)
    static var upgradeInfoUrlFont: UIFont = .systemFont(ofSize: 12, weight: .bold)
    static var upgradeInfoBodyTextColor: UIColor = UIColor("C0C0C0")//UIColor("9BA0AA")
    static var upgradeInfoTitleTextColor: UIColor = .white
    static var termsServiceUrl: String = ""
    static var privacyPolicyUrl: String = ""
    
    static var upgradeInfoText: String = "Recurring billing, cancel anytime.\nBy tapping Continue, your payment will be charged to your iTunes account, and your subscription will automatically renew for the same package length at the same price until you cancel in settings in the iTunes store at least 24 hours prior to the end of the current period. By continuing, you agree to our Privacy Policy and Terms of Service."
    
    static var featuresBackgroundColor: UIColor = UIColor("3897F1")
    static var subscriptionsBackgroundColor: UIColor = UIColor("DCDEE3")
    static var backgroundColor: UIColor = .white
    
    static var products: [SKProduct] = []
    
    static var features: [SwiftyUpgradeFeature] = [SwiftyUpgradeFeature(),
                                                   SwiftyUpgradeFeature(),
                                                   SwiftyUpgradeFeature()]
    
    // MARK: - Subscriptions Cell
    
    static var subCellBorderColor: UIColor = UIColor("FECB24")
    static var subCellBackgroundColor: UIColor = .white
    static var subCellTextColor: UIColor = UIColor("898E97")
    static var subCellSelectedTextColor: UIColor = UIColor("555555")
    
    static var subCellDurationCountFont: UIFont = .systemFont(ofSize: 33, weight: .bold)
    
    static var subCellDurationFont: UIFont = .systemFont(ofSize: 16, weight: .regular)
    
    static var subCellPriceFont: UIFont = .systemFont(ofSize: 16, weight: .medium)
    
    static var subCellBadgeBackgroundColor: UIColor = UIColor("FECB24")
    static var subCellBadgeTextColor: UIColor = UIColor("898E97")
    static var subCellBadgeFont: UIFont = .systemFont(ofSize: 12, weight: .regular)
    
    
    // MARK: - Features Cell
    
    static var upgradeCellImageTintColor: UIColor = .white
    
    static var upgradeCellTitleTextColor: UIColor = .white
    static var upgradeCellTitleFont: UIFont = .systemFont(ofSize: 20, weight: .heavy)
    
    static var upgradeCellSubTitleTextColor: UIColor = .white
    static var upgradeCellSubTitleFont: UIFont = .systemFont(ofSize: 15, weight: .light)
    
}
