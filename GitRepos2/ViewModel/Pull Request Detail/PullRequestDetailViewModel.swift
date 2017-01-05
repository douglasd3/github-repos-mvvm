//
//  PullRequestDetailViewModel.swift
//  GitRepos2
//
//  Created by Houssan A. Hijazi on 1/5/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import RxSwift

class PullRequestDetailViewModel {
    
    fileprivate var apiClient = NetworkClient()
    
    let model: PullRequest
    var coordinator: PullRequestsCoordinator!
    
    fileprivate let disposeBag = DisposeBag()
    
    init(model: PullRequest) {
        self.model = model
    }
}
