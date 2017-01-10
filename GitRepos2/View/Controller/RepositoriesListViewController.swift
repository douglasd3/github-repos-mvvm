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
    
    // MARK: IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: RepositoriesListViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }

}

// MARK: Life Cycle

extension RepositoriesListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadCurrentRepositoryPage()
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

// MARK: Setup UI

extension RepositoriesListViewController {
    
    fileprivate func setup() {
        setupTableView()
        setupNavigationBar()
        setupLoadingState()
        //setupTableViewDataSource()
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
    
}

// MARK: Helpers

extension RepositoriesListViewController{
    
    func loadCurrentRepositoryPage() {
        startLoading()
        viewModel.loadRepositoryPage()
    }
    
}

// MARK: TableViewDelegate and DataSource

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
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! RepositoryCell                
        
        viewModel.itemSelected(item: cell.viewModel.createDetailViewModel())
    }
    
}

// MARK: ScrollViewDelegate

extension RepositoriesListViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = view.bounds.height * 0.6
        if (scrollView.isNearBottomEdge(edgeOffset: offset)) {
            if !viewModel.isLoadingPage {
                viewModel.loadRepositoryPage()
            }
        }
    }
    
}

// MARK: ViewModelDelegate

extension RepositoriesListViewController: ViewModelDelegate {
    
    func apiCallDidFinish(error: Error?) {        
        if let error = error {
            endLoading(error: error)
        }
        else {
            tableView.reloadData()
            endLoading()
        }
    }
    
}

