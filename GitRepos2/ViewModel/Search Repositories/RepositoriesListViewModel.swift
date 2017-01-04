//
//  RepositoriesListViewModel.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import RxSwift

class RepositoriesListViewModel {
    
    fileprivate var apiClient = NetworkClient()
    
    var nextPageTrigger: Observable<Void> = .empty()
    fileprivate let disposeBag = DisposeBag()
    
    var apiResponseHandler: (()->Void)!
    
    var dataSource: [Repository] = []//[Repository(name: "Repo1", numberOfForks: 3, numberOfStars: 4, fullname: "Repo 1 legal", description: "Blalalalalalalldkjasjal"), Repository(name: "Repo2", numberOfForks: 399, numberOfStars: 42, fullname: "Repo 2 legal", description: "Blalalalalalalldkjasja2l"), Repository(name: "Repo3", numberOfForks: 3990, numberOfStars: 422, fullname: "Repo 2 legal", description: "Blalalalalalalldkjasja2lBlalalalalalalldkjasja2lBlalalalalalalldkjasja2lBlalalalalalalldkjasja2l")]
    
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
                print(self.dataSource)
                self.apiResponseHandler()
            }).addDisposableTo(disposeBag)
    }
    
    func showRepoDetail(item: RepositoryDetailViewModel) {
        coordinator.showRepoDetail(viewModel: item)
    }
    
}
