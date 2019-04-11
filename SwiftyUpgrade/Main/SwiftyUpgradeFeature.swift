//
//  SwiftyUpgradeFeature.swift
//  SwiftyUpgrade
//
//  Created by Juan Pablo Fernandez on 4/11/19.
//  Copyright © 2019 Juan Pablo Fernandez. All rights reserved.
//

import Foundation

public class SwiftyUpgradeFeature {
    
    var title: String = "Feature Title"
    var description: String = "Feature Description"
    var image: UIImage? = nil
    
    init() {
        
    }
    
    convenience init(title: String, description: String, image: UIImage?) {
        self.init()
        self.title = title
        self.description = description
        self.image = image
    }
}
