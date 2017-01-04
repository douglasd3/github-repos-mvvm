//
//  RepositoryDetailViewModel.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 04/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation

class RepositoryDetailViewModel {
    
    fileprivate var apiClient = NetworkClient()
    
    var coordinator: RepositoriesCoordinator!
    let repository: Repository
//    var hasContent: Bool {
//        return loadingStateVariable.value ? false : pullsVariable.value.count > 0
//    }
    
    init(repository: Repository) {
        self.repository = repository    
    }
    
}
