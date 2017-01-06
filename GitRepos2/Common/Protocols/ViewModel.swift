//
//  ViewModel.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 05/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import Foundation

protocol ViewModel {}

protocol ViewModelDelegate {
    
    func apiCallDidFinish(error: Error?)
    
}

extension ViewModelDelegate {
    
    func apiCallDidFinish(error: Error? = nil) {
        apiCallDidFinish(error: error)
    }
}

