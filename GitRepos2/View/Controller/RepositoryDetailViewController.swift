//
//  RepositoryDetailViewController.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 04/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //fileprivate let dataSource = RxTableViewSectionedReloadDataSource<SectionViewModel<PullRequestItemViewModel>>()
    
    var viewModel: RepositoryDetailViewModel!
    
}

// MARK: Life Cycle

extension RepositoryDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
