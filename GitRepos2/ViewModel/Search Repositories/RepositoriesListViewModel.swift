//
//  RepositoriesListViewModel.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import RxSwift

class RepositoriesListViewModel: ViewModel {
    
    fileprivate var apiClient = NetworkClient()
    
    var nextPageTrigger: Observable<Void> = .empty()
    fileprivate let disposeBag = DisposeBag()
        
    var delegate: ViewModelDelegate!
    
    var dataSource: [Repository] = []
    
    var coordinator: RepositoriesCoordinator!
    
    var hasContent: Bool {
        return dataSource.count > 0
    }
    
    init() {

    }
    
}

// MARK: Helpers

extension RepositoriesListViewModel {
    
    func fetchRepositories() {
        apiClient.searchRepositories(nextPageTrigger: nextPageTrigger)
            .skip(1)
            .subscribe(onNext: { (repositories) in
                self.dataSource = repositories
                self.delegate.apiCallDidFinish()
            }).addDisposableTo(disposeBag)
    }
    
    func showRepoDetail(item: PullRequestsListViewModel) {
        coordinator.showRepoDetail(viewModel: item)
    }
    
}
