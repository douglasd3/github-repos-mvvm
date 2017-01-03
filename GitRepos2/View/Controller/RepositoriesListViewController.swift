//
//  RepositoriesListViewController.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import UIKit

class RepositoriesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: RepositoriesListViewModel!

}

// MARK: Life Cycle

extension RepositoriesListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
//        viewModel.fetchRepositories()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        setupInitialViewState()
//        
//        if let indexPath = tableView.indexPathForSelectedRow {
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
//    }
    
}

// MARK: Setup

extension RepositoriesListViewController {
    
    fileprivate func setup() {
        setupTableView()
        setupNavigationBar()
//        setupTableViewDataSource()
//        setupLoadingState()
    }
    
    fileprivate func setupNavigationBar() {
        title = "Github Repositories"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    fileprivate func setupTableView() {
        tableView.register(R.nib.repositoryCell)
        tableView.rowHeight = 113
    }
    
}

extension RepositoriesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RepositoryCell.self))
        
        return cell!
    }
    
}

