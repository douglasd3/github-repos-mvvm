//
//  RepositoryDetailViewController.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 04/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //fileprivate let dataSource = RxTableViewSectionedReloadDataSource<SectionViewModel<PullRequestItemViewModel>>()
    
    var viewModel: RepositoryDetailViewModel!
    
}

// MARK: Life Cycle

extension RepositoryDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        viewModel.apiResponseHandler = {
            self.tableView.reloadData()
        }
        
        viewModel.fetchPullRequests()
    }
    
}

// MARK: Setup UI

extension RepositoryDetailViewController {
    
    fileprivate func setup() {
        setupNavigationBar()
        setupTableView()
//        setupLoadingState()
    }
    
    fileprivate func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        title = viewModel.repositoryName        
    }
    
    fileprivate func setupTableView() {
        tableView.register(R.nib.pullRequestCell)
        tableView.rowHeight = 112
    }
    
}

extension RepositoryDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PullRequestCell.self)) as! PullRequestCell
        
        cell.viewModel = PullRequestItemViewModel(model: viewModel.dataSource[indexPath.row])//RepositoryItemViewModel(model: viewModel.dataSource[indexPath.row])
        
        return cell
    }
    
}

