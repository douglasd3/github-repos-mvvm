//
//  PullRequestItemViewModel.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 04/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import SwiftDate

class PullRequestItemViewModel: ViewModel {
    
    let model: PullRequest
    
    init(model: PullRequest) {
        self.model = model
    }
    
    var title: String! {
        return model.title
    }
    
    var avatarURL: URL! {
        return model.user.avatarUrl
    }
    
    var userLogin: String {
        return model.user.login
    }
    
    var body: String {
        return model.body
    }
    
    var date: String {
        return model.createdAt.string(format: .custom("dd/MM/yyyy"))
    }
    
}
extension PullRequestItemViewModel {
    
    func createDetailViewModel(repository: Repository) -> PullRequestDetailViewModel {
        return PullRequestDetailViewModel(pullRequest: model, repository: repository)
    }
    
}
