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
        fetchPullRequest()
    }

}

// MARK: StatefulViewController

extension PullRequestDetailViewController: StatefulViewController {
    
    func hasContent() -> Bool {
        return viewModel.hasContent
    }
    
}

// MARK: Setup UI

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

// MARK: Helpers

extension PullRequestDetailViewController{
    
    func fetchPullRequest() {
        startLoading()
        viewModel.fetchPullRequest()
    }
    
}

// MARK: ViewModelDelegate

extension PullRequestDetailViewController: ViewModelDelegate {
    
    func apiCallDidFinish(error: Error?) {
        if let error = error {
            endLoading(error: error)
        }
        else {
            titleLabel.text = viewModel.pullRequestTitle
            descriptionLabel.text = viewModel.pullRequestDescription
            statusLabel.text = viewModel.pullRequestState
            statusLabel.textColor = viewModel.pullRequestState == "open" ? Color.green : Color.red
            endLoading()
        }
    }
    
}
