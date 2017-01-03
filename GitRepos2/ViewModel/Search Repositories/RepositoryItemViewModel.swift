//
//  RepositoryItemViewModel.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation

class RepositoryItemViewModel {
    
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
        return "Teste"
    }
    
    var repoFullName: String! {
        return model.fullname
    }
    //var ownerImage: UIImage!
    
    init(model: Repository) {
        self.model = model
    }
}
