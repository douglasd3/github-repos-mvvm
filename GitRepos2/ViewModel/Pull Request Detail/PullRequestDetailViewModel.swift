//
//  PullRequestDetailViewModel.swift
//  GitRepos2
//
//  Created by Houssan A. Hijazi on 1/5/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import RxSwift

class PullRequestDetailViewModel: ViewModel {
    
    fileprivate var apiClient = NetworkClient()
    
    let pullRequest: PullRequest
    let repository: Repository
    var pullRequestDetail: PullRequestDetail?
    
    var coordinator: PullRequestsCoordinator!
    
    fileprivate let disposeBag = DisposeBag()
        
    var delegate: ViewModelDelegate!
    
    var pullRequestTitle: String? {
        return pullRequestDetail?.title
    }
    
    var pullRequestDescription: String? {
        return pullRequestDetail?.body
    }
    
    var pullRequestState: String? {
        return pullRequestDetail?.state
    }
    
    var pullRequestNumber: String? {
        return String(pullRequest.number)
    }
    
    var hasContent: Bool {
        return pullRequestDetail != nil
    }
    
    init(pullRequest: PullRequest, repository: Repository) {
        self.pullRequest = pullRequest
        self.repository = repository
    }
}
extension PullRequestDetailViewModel {
    
    func fetchPullRequest() {
        apiClient.loadPullRequestDetail(forRepo: repository.name, owner: repository.owner.login, number: pullRequest.number)
            .subscribe(onNext: {
                (pullRequestDetail) in
                self.pullRequestDetail = pullRequestDetail
                self.delegate.apiCallDidFinish()
            }, onError: { error in
                self.delegate.apiCallDidFinish(error: error)
            }).addDisposableTo(disposeBag)
    }
    
    
}
