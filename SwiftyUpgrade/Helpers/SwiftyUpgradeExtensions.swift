//
//  SwiftyUpgradeExtensions.swift
//  SwiftyUpgrade
//
//  Created by Juan Pablo Fernandez on 4/10/19.
//  Copyright © 2019 Juan Pablo Fernandez. All rights reserved.
//

import Foundation

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(_ hex: String, alpha: CGFloat = 1.0) {
        let hex: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hex.count != 6 {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: hex).scanHexInt32(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
