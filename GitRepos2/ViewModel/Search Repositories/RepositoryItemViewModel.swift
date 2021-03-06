//
//  RepositoryItemViewModel.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import UIKit

class RepositoryItemViewModel: ViewModel {
    
    let model: Repository
    
    var repoName: String! {
        return model.name
    }
    
    var repoDescription: String! {
        return model.description
    }
    
    var forks: String! {
        return String(model.numberOfForks)
    }
    
    var stars: String! {
        return String(model.numberOfStars)
    }
    
    var owner: String! {
        return model.owner.login
    }
    
    var repoFullName: String! {
        return model.fullname
    }
    
    var ownerImageURL: URL! {
        return model.owner.avatarUrl
    }
    
    init(model: Repository) {
        self.model = model
    }
    
}

// MARK: Setup PullRequestsListViewModel with repository

extension RepositoryItemViewModel {
    
    func createDetailViewModel() -> PullRequestsListViewModel {
        return PullRequestsListViewModel(repository: model)
    }
    
}
