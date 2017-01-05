//
//  PullRequestDetail.swift
//  GitRepos2
//
//  Created by Houssan A. Hijazi on 1/5/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import ObjectMapper

struct PullRequestDetail: Mappable {
    
    enum Key: String {
        case id, state, title, body
    }
    
    // swiftlint:disable variable_name
    var id: Int!
    var state: String!
    var title: String!
    var body: String!
    
    init?(map: Map) { }
    init() { }
    
    mutating func mapping(map: Map) {
        id          <- map[Key.id.rawValue]
        state       <- map[Key.state.rawValue]
        title       <- map[Key.title.rawValue]
        body   <- map[Key.body.rawValue]
    }
    
}
