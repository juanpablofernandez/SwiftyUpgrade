//
//  SwiftyUpgradeFeature.swift
//  SwiftyUpgrade
//
//  Created by Juan Pablo Fernandez on 4/11/19.
//  Copyright © 2019 Juan Pablo Fernandez. All rights reserved.
//

import Foundation

public class SwiftyUpgradeFeature {
    
    public var title: String = "Feature Title"
    public var description: String = "Feature Description"
    public var image: UIImage? = nil
    
    public init() {
        
    }
    
    public convenience init(title: String, description: String, image: UIImage?) {
        self.init()
        self.title = title
        self.description = description
        self.image = image
    }
}
