//
//  SwiftyUpgrade.swift
//  SwiftyUpgrade
//
//  Created by Juan Pablo Fernandez on 1/23/19.
//  Copyright © 2019 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import StoreKit

class SwiftyUpgradeSubscriptionCell: UICollectionViewCell {
    
    var product: SKProduct? {
        didSet {
            guard let product = product else { return }
            let price = product.localizedPrice
            guard let unitAmount = product.subscriptionPeriod?.numberOfUnits,
                let unit = product.subscriptionPeriod?.unit else { return }
            
            self.price.text = "\(price)"
            self.durationCount.text = "\(unitAmount)"
            self.duration.text = "\(unit.description())"
            if unitAmount > 1 {
                self.duration.text! += "s"
            }
        }
    }
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = SwiftyUpgrade.subCellBackgroundColor
        view.layer.borderColor = SwiftyUpgrade.subCellBorderColor.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.alignment = .center
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var durationCount: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = SwiftyUpgrade.subCellDurationCountFont
        label.textAlignment = .center
        label.textColor = SwiftyUpgrade.subCellTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var duration: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = SwiftyUpgrade.subCellDurationFont
        label.textAlignment = .center
        label.textColor = SwiftyUpgrade.subCellTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var price: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = SwiftyUpgrade.subCellPriceFont
        label.textAlignment = .center
        label.textColor = SwiftyUpgrade.subCellTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var badge: UILabel = {
        let label = UILabel()
        label.text = "Save 11%"
        label.font = SwiftyUpgrade.subCellBadgeFont
        label.textAlignment = .center
        label.textColor = SwiftyUpgrade.subCellBadgeTextColor
        label.backgroundColor = SwiftyUpgrade.subCellBadgeBackgroundColor
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.numberOfLines = 1
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                containerView.layer.borderWidth = 4
                badge.isHidden = false
                changeTextColor(SwiftyUpgrade.subCellSelectedTextColor)
                
            } else {
                containerView.layer.borderWidth = 0
                changeTextColor(SwiftyUpgrade.subCellTextColor)
                badge.isHidden = true
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        //Main
        self.backgroundColor = SwiftyUpgrade.subCellBackgroundColor
        self.clipsToBounds = false
        
        //Container View
        self.addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        //Labels
        stackView.addArrangedSubview(durationCount)
        stackView.addArrangedSubview(duration)
        stackView.addArrangedSubview(price)
        
        //Stack View
        containerView.addSubview(stackView)
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        //Badge
//        self.addSubview(badge)
//        badge.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
//        badge.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
//        badge.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//        badge.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func changeTextColor(_ color: UIColor) {
        durationCount.textColor = color
        duration.textColor = color
        price.textColor = color
    }
}
