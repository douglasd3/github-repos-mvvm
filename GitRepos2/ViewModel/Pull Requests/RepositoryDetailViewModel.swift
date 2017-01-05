//
//  RepositoryDetailViewModel.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 04/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import RxSwift

class RepositoryDetailViewModel {
    
    fileprivate var apiClient = NetworkClient()
    
    var dataSource: [PullRequest] = []
    
    var coordinator: PullRequestsCoordinator!
    let repository: Repository
    
    fileprivate let disposeBag = DisposeBag()
    
    var apiResponseHandler: (()->Void)!

    var hasContent: Bool {
        return dataSource.count > 0
    }
    
    init(repository: Repository) {
        self.repository = repository    
    }
    
}

// MARK: Computed Property

extension RepositoryDetailViewModel {
    
    var repositoryName: String {
        return repository.name
    }
    
//    var pullRequests: Driver<[SectionViewModel<PullRequestItemViewModel>]> {
//        return pullsViewModel
//            .asDriver(onErrorJustReturn: [])
//            .map {
//                [SectionViewModel(viewModels: $0)]
//        }
//    }
//    
//    var pullsViewModel: Observable<[PullRequestItemViewModel]> {
//        return pullsVariable.asObservable()
//            .map { (pulls) in
//                return pulls.map { repo in
//                    return PullRequestItemViewModel(model: repo)
//                }
//        }
//    }
    
}


extension RepositoryDetailViewModel {
    
    func fetchPullRequests() {
        apiClient.loadPullRequest(forRepo: repository.name, owner: repository.owner.login)
            .subscribe(onNext: { (pulls) in
                self.dataSource = pulls
                self.apiResponseHandler()
            }).addDisposableTo(disposeBag)
    }
    
    func showPullRequestDetail(viewModel: PullRequestDetailViewModel)
    {
        coordinator.showRepoDetail(viewModel: viewModel)
    }
}

