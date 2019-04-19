//
//  SwiftyUpgrade.swift
//  SwiftyUpgrade
//
//  Created by Juan Pablo on 8/13/18.
//  Copyright © 2018 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

class BounceButton: UIButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform.identity
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
        }, completion: nil)
        
        super.touchesBegan(touches, with: event)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            
            self.transform = CGAffineTransform.identity
            
        }, completion: nil)
        
        super.touchesEnded(touches, with: event)
    }
}

class PrimaryUpgradeButton: BounceButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.textAlignment = .center
        self.sizeToFit()
    }
    
    func addAttributed(title: String, subtitle: String) {

        //Title Attributed String
        let titleAttrs: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 15, weight: .bold),
                                                          .foregroundColor: UIColor.white]
        
        //SubTitle Attributed String
        let subTitleAttrs: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .light),
                                                             .foregroundColor: UIColor.white]
        
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: "\(title)\n", attributes: titleAttrs))
        attributedString.append(NSAttributedString(string: subtitle, attributes: subTitleAttrs))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}


