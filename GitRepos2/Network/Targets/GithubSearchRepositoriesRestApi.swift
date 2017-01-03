//
//  GithubSearchRepositoriesRestApi.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Moya

enum GithubSearchRepositoriesRestApi {
    case repositories(Int)
}

extension GithubSearchRepositoriesRestApi: GithubRestApi {
    
    var path: String {
        switch self {
        case .repositories(_): return "/search/repositories"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .repositories(let page): return ["q": "language:Swift", "sort":"stars", "page": page]
        }
    }
    
    var sampleData: Data {
        switch self {
        case .repositories: return "{}".data(using: String.Encoding.utf8)!
        }
    }
    
}
