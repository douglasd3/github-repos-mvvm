//
//  GithubRestApi.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Moya

protocol GithubRestApi: TargetType { }

extension GithubRestApi {
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .request
    }
    
    var url: String {
        return "\(baseURL)\(path)".urlEscaped
    }
    
}
