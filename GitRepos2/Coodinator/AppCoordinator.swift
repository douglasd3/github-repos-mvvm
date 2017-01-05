//
//  AppCoordinator.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    enum CoordinatorKey: String {
        case repositories
        case pullRequests
    }
    
    var window: UIWindow
    var childCoordinators: [String: Coordinator] = [:]
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let reposCoordinator = RepositoriesCoordinator(window: window)
        childCoordinators[CoordinatorKey.repositories.rawValue] = reposCoordinator
        reposCoordinator.start()
        
        window.makeKeyAndVisible()
    }
    
}
