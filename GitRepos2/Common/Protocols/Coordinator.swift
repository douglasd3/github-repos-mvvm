//
//  Coordinator.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    
    init(window: UIWindow)
    
    func start<T>(viewModel: T?) where T:ViewModel
    
}

extension Coordinator {
    
    func start<T>(viewModel: T? = nil) where T:ViewModel {        
        start(viewModel: viewModel)
    }
    
}
