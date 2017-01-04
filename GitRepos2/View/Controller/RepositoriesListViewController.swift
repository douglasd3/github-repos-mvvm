//
//  RepositoriesListViewController.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import UIKit
import StatefulViewController
import RxDataSources
import RxSwift

class RepositoriesListViewController: UIViewController, LoadingStatePresentableViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: RepositoriesListViewModel!
    var page = 0

}

// MARK: Life Cycle

extension RepositoriesListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("print")
        
        setup()
        viewModel.apiResponseHandler = {
            self.tableView.reloadData()
            self.endLoading()
        }
        
        startLoading()
        viewModel.fetchRepositories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupInitialViewState()
    }
    
}

// MARK: StatefulViewController

extension RepositoriesListViewController: StatefulViewController {
    
    func hasContent() -> Bool {
        return viewModel.hasContent
    }
    
}

// MARK: Setup

extension RepositoriesListViewController {
    
    fileprivate func setup() {
        setupTableView()
        setupNavigationBar()
        setupLoadingState()
        setupTableViewDataSource()
    }
    
    fileprivate func setupNavigationBar() {
        title = "Github Repositories"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    fileprivate func setupTableView() {
        tableView.register(R.nib.repositoryCell)
        tableView.rowHeight = 113
        tableView.delegate = self
    }
    
    fileprivate func setupTableViewDataSource() {
        
        let offset = view.bounds.height * 0.6
        viewModel.nextPageTrigger = tableView.rx.contentOffset
            .flatMap { _ in
                self.tableView.isNearBottomEdge(edgeOffset: offset) ? Observable.just(()) : Observable.empty()
        }

    }
    
}

extension RepositoriesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RepositoryCell.self)) as! RepositoryCell
        
        cell.viewModel = RepositoryItemViewModel(model: viewModel.dataSource[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RepositoryCell
        
        viewModel.showRepoDetail(item: cell.viewModel.createDetailViewModel())
    }
    
}

extension RepositoriesListViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.isNearBottomEdge() {
            print("fim")
        }
    }
    
}

