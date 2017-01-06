//
//  PullRequestDetailViewController.swift
//  GitRepos2
//
//  Created by Houssan A. Hijazi on 1/5/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import UIKit
import SwiftyColor
import StatefulViewController

class PullRequestDetailViewController: UIViewController, LoadingStatePresentableViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var viewModel: PullRequestDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        viewModel.apiResponseHandler = {
            self.titleLabel.text = self.viewModel.pullRequestTitle
            self.descriptionLabel.text = self.viewModel.pullRequestDescription
            self.statusLabel.text = self.viewModel.pullRequestState
            self.statusLabel.textColor = self.viewModel.pullRequestState == "open" ? Color.green : Color.red
            self.endLoading()
        }
        
        startLoading()
        viewModel.fetchPullRequest()
    }

}

// MARK: StatefulViewController

extension PullRequestDetailViewController: StatefulViewController {
    
    func hasContent() -> Bool {
        return viewModel.hasContent
    }
    
}


extension PullRequestDetailViewController {
    
    func setup() {
        setupNavigationBar()
        setupLoadingState()
    }
    
    func setupNavigationBar() {
        if let number = viewModel.pullRequestNumber {
            title = "#\(number)"
        }
    }
    
}
