//
//  User.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import ObjectMapper

struct User: Mappable {
    
    enum Key: String {
        case id, login, avatarUrl = "avatar_url"
    }
    
    // swiftlint:disable variable_name
    var id: Int!
    var login: String!
    var avatarUrl: URL!
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        id          <- map[Key.id.rawValue]
        login       <- map[Key.login.rawValue]
        avatarUrl   <- (map[Key.avatarUrl.rawValue], URLTransform())
    }
    
}
