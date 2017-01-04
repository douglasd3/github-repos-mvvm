//
//  PullRequest.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 04/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import ObjectMapper

struct PullRequest: Mappable {
    
    enum Key: String {
        case id, body, createdAt = "created_at", user, title, htmlUrl = "html_url", number
    }
    
    // swiftlint:disable variable_name
    var id: Int!
    var body: String!
    var title: String!
    var createdAt: Date!
    var user: User!
    var url: URL!
    var number: Int!
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        id          <- map[Key.id.rawValue]
        title       <- map[Key.title.rawValue]
        body        <- map[Key.body.rawValue]
        user        <- map[Key.user.rawValue]
        createdAt   <- (map[Key.createdAt.rawValue], ISO8601DateTransform())
        url         <- (map[Key.htmlUrl.rawValue], URLTransform())
        number      <- map[Key.number.rawValue]
    }
    
}
