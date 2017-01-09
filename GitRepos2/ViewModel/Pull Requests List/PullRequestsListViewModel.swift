//
//  RepositoryDetailViewModel.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 04/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import RxSwift

class PullRequestsListViewModel: ViewModel {
    
    fileprivate var apiClient = NetworkClient()
    fileprivate let disposeBag = DisposeBag()
    
    let repository: Repository
    
    var dataSource: [PullRequest] = []
    var coordinator: PullRequestsCoordinator!
    var delegate: ViewModelDelegate!
    
    init(repository: Repository) {
        self.repository = repository    
    }
    
}

// MARK: Computed Property

extension PullRequestsListViewModel {
    
    var hasContent: Bool {
        return dataSource.count > 0
    }
    
    var repositoryName: String {
        return repository.name
    }
    
}

// MARK: Helpers

extension PullRequestsListViewModel {
    
    func fetchPullRequests() {
        apiClient.loadPullRequest(forRepo: repository.name, owner: repository.owner.login)
            .subscribe(onNext: { (pulls) in
                self.dataSource = pulls
                self.delegate.apiCallDidFinish()
                
            }, onError: { error in
                self.delegate.apiCallDidFinish(error: error)
            }).addDisposableTo(disposeBag)
    }
    
    func showPullRequestDetail(viewModel: PullRequestDetailViewModel) {
        coordinator.showPullRequestDetail(viewModel: viewModel)
    }
    
}

