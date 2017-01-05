//
//  GithubReposRestApi.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 04/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Moya

enum GithubReposRestApi {
    case pullRequests(owner: String, repo: String)
    case pullRequestDetail(owner: String, repo: String, number: String)
}

extension GithubReposRestApi: GithubRestApi {
    
    var path: String {
        switch self {
        case .pullRequests(let owner, let repo): return "/repos/\(owner)/\(repo)/pulls"
        case .pullRequestDetail(let owner, let repo, let number): return "/repos/\(owner)/\(repo)/pulls/\(number)"
        }
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
}
