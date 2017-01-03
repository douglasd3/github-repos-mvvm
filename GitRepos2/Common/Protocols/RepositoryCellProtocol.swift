//
//  RepositoryCellProtocol.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation
import UIKit

protocol RepositoryCellProtocol {
    
    var repoName: String { get set }
    var repoDescription: String { get }
    var forks: String { get }
    var stars: String { get }
    var owner: String { get }
    var repoFullName: String { get }
    //var ownerImage: UIImage { get }
    
}
