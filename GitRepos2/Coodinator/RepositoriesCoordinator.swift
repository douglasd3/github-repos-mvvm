//
//  RepositoriesCoordinator.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import UIKit

class RepositoriesCoordinator: Coordinator {
    
    fileprivate let window: UIWindow
    fileprivate var currentNavigationController: UINavigationController?
    
    required init(window: UIWindow) {
        self.window = window
        currentNavigationController = R.storyboard.main.instantiateInitialViewController()
    }
    
    func start() {
        guard let viewController = currentNavigationController?.topViewController as? RepositoriesListViewController else { return }
        
        let viewModel = RepositoriesListViewModel()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        window.rootViewController = currentNavigationController
    }
    
}

extension RepositoriesCoordinator: RepositoriesListViewModelCoordinatorDelegate {
    
    func didSelectItem(viewModel: PullRequestsListViewModel) {
        guard let viewController = R.storyboard.main.pullRequestsListViewController() else { return }
        
        viewModel.coordinatorDelegate = self
        viewModel.viewDelegate = viewController
        viewController.viewModel = viewModel
        currentNavigationController?.pushViewController(viewController, animated: true)                
    }
    
}

extension RepositoriesCoordinator: PullRequestsListViewModelCoordinatorDelegate {
    
    func didSelectItem(viewModel: PullRequestDetailViewModel) {
        guard let viewController = R.storyboard.main.pullRequestDetailViewController() else { return }
        
        viewModel.viewDelegate = viewController
        viewController.viewModel = viewModel
        
        currentNavigationController?.pushViewController(viewController, animated: true)
    }
    
}

