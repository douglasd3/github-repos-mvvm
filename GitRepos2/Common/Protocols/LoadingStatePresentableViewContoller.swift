//
//  LoadingStatePresentableViewContoller.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import StatefulViewController
import SpringIndicator
import SwiftyColor

protocol LoadingStatePresentableViewController {
    func setupLoadingState()
}


extension LoadingStatePresentableViewController where Self: UIViewController, Self: StatefulViewController {
    
    func setupLoadingState() {
        let indicatorContainer = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let indicator = SpringIndicator(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        
        indicator.lineWidth = 2
        indicator.lineColor = UIColor.blue
        indicator.startAnimation()
        indicatorContainer.addSubview(indicator)
        
        loadingView = UIView()
        loadingView?.isUserInteractionEnabled = false
        loadingView?.backgroundColor = UIColor.white
        loadingView?.addSubview(indicatorContainer)
        
        indicatorContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: indicatorContainer, attribute: .width, relatedBy: .equal, toItem: indicator, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: indicatorContainer, attribute: .height, relatedBy: .equal, toItem: indicator, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: indicatorContainer, attribute: .centerX, relatedBy: .equal, toItem: loadingView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: indicatorContainer, attribute: .centerY, relatedBy: .equal, toItem: loadingView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        let errorButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        errorButton.center = view.center
        errorButton.setTitle("Retry", for: .normal)
        errorButton.setTitleColor(Color.red, for: .normal)
        
        errorView = UIView()
        errorView?.backgroundColor = Color.white
        errorView?.addSubview(errorButton)
    }    
    
}
