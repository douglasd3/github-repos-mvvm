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
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        guard let navigationController = R.storyboard.main.instantiateInitialViewController() else { return }
        guard let viewController = navigationController.topViewController as? RepositoriesListViewController else { return }
        
        let viewModel = RepositoriesListViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        window.rootViewController = navigationController
    }
    
}

extension RepositoriesCoordinator {
    
    func showRepoDetail(viewModel: RepositoryDetailViewModel) {
        let pullRequestCoordinator = PullRequestsCoordinator(window: window)
        pullRequestCoordinator.start(viewModel: viewModel)
    }
    
}

