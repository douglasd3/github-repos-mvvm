//
//  PullRequestsCoordinator.swift
//  GitRepos2
//
//  Created by Houssan A. Hijazi on 1/5/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import UIKit

class PullRequestsCoordinator: Coordinator {
    
    fileprivate let window: UIWindow
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    func start(viewModel: PullRequestsListViewModel?) {
        guard let viewController = R.storyboard.main.pullRequestsListViewController() else { return }
        guard let currentNavigationController = window.rootViewController as? UINavigationController else { return }
        
        viewModel?.coordinator = self
        viewModel?.delegate = viewController
        viewController.viewModel = viewModel
        currentNavigationController.pushViewController(viewController, animated: true)
    }
    
    func showPullRequestDetail(viewModel: PullRequestDetailViewModel) {
        guard let viewController = R.storyboard.main.pullRequestDetailViewController() else { return }

        guard let currentNavigationController = window.rootViewController as? UINavigationController else { return }
        
        viewModel.delegate = viewController
        viewController.viewModel = viewModel    
    
        currentNavigationController.pushViewController(viewController, animated: true)
    }
    
}
