//
//  Repository.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import ObjectMapper

struct Repository: Mappable {
    
    enum Key: String {
        case id, name, numberOfForks = "forks_count", numberOfStars = "stargazers_count", owner, fullname = "full_name", description
    }
    
    // swiftlint:disable variable_name
    var id: Int!
    var name: String!
    var numberOfForks: Int!
    var numberOfStars: Int!
    var fullname: String!
    var description: String?
    //var owner: User!
    
    init?(map: Map) { }
    
    init (name: String, numberOfForks: Int, numberOfStars: Int, fullname: String, description: String) {
        self.name = name
        self.numberOfForks = numberOfForks
        self.numberOfStars = numberOfStars
        self.fullname = fullname
        self.description = description
    }
    
    mutating func mapping(map: Map) {
        id              <- map[Key.id.rawValue]
        name            <- map[Key.name.rawValue]
        numberOfForks   <- map[Key.numberOfForks.rawValue]
        numberOfStars   <- map[Key.numberOfStars.rawValue]
        fullname        <- map[Key.fullname.rawValue]
        description     <- map[Key.description.rawValue]
        //owner           <- map[Key.owner.rawValue]
    }
    
}

