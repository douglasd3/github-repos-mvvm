//
//  RepositoriesListViewModel.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import RxSwift

protocol RepositoriesListViewModelCoordinatorDelegate {
    
    func didSelectItem(viewModel: PullRequestsListViewModel)
    
}

class RepositoriesListViewModel: ViewModel {
    
    fileprivate var apiClient = NetworkClient()
    fileprivate let disposeBag = DisposeBag()        
        
    var viewDelegate: ViewModelDelegate!
    var coordinatorDelegate: RepositoriesListViewModelCoordinatorDelegate?
    
    var dataSource: [Repository] = []
    var isLoadingPage = false
    var page = 1    
    
}

// MARK: Computed Property

extension RepositoriesListViewModel {
    
    var hasContent: Bool {
        return dataSource.count > 0
    }
    
}

// MARK: Helpers

extension RepositoriesListViewModel {
    
    func loadRepositoryPage() {
        isLoadingPage = true
        apiClient.loadRepositoriesPage(page)
            .subscribe(onNext: { (repositories) in
                self.dataSource.append(contentsOf: repositories)
                self.viewDelegate.apiCallDidFinish()
                self.isLoadingPage = false
                self.page += 1
            }, onError: { error in
                self.viewDelegate.apiCallDidFinish(error: error)
                self.isLoadingPage = false
            }).addDisposableTo(disposeBag)
    }
    
    func itemSelected(item: PullRequestsListViewModel) {
        coordinatorDelegate?.didSelectItem(viewModel: item)
    }
    
}
