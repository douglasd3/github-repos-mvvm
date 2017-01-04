//
//  ScrollViewExtension.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 04/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    func isNearBottomEdge(edgeOffset: CGFloat = 20.0) -> Bool {
        return self.contentOffset.y + self.frame.size.height + edgeOffset > self.contentSize.height
    }
    
}
