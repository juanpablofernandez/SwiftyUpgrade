//
//  SwiftyUpgrade.swift
//  SwiftyUpgrade
//
//  Created by Juan Pablo Fernandez on 1/24/19.
//  Copyright © 2019 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

class SwiftyUpgradeFeaturesCell: UICollectionViewCell {
    
    var image: UIImageView = {
        let view = UIImageView()
//        view.image = #imageLiteral(resourceName: "iphone-upgrade-features-users")
        view.contentMode = .scaleAspectFit
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 10), for: .vertical)
        return view
    }()
    
    var title: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = SwiftyUpgrade.upgradeCellTitleFont
        label.textAlignment = .center
        label.textColor = SwiftyUpgrade.upgradeCellTitleTextColor
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 499), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var subTitle: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = SwiftyUpgrade.upgradeCellSubTitleFont
        label.textAlignment = .center
        label.textColor = SwiftyUpgrade.upgradeCellSubTitleTextColor
        label.numberOfLines = 0
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 1), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 500), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        //ImageView
        self.addSubview(image)
        image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        image.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        image.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        image.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        //Title
        self.addSubview(title)
        title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 25).isActive = true
        
        //Subtitle
        self.addSubview(subTitle)
        subTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        subTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15).isActive = true
    }
}
