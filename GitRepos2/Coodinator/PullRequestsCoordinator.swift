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
    func start() {
      
    }
    func showPullRequestDetail(viewModel: PullRequestDetailViewModel) {
        
        guard let viewController = R.storyboard.main.pullRequestDetailViewController() else { return }
        
//        let viewModel = PullRequestDetailViewModel()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
//        window.rootViewController = navigationController
    }
    
}
