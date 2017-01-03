//
//  RepositoryCell.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 03/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import UIKit
import PINRemoteImage

class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var repoFullNameLabel: UILabel!
    @IBOutlet weak var ownerImageView: UIImageView!

    var viewModel: RepositoryItemViewModel! {
        didSet {
            repoNameLabel.text = viewModel.repoName
            repoDescriptionLabel.text = viewModel.repoDescription
            forksLabel.text = viewModel.forks
            starsLabel.text = viewModel.stars
            ownerLabel.text = viewModel.owner
            repoFullNameLabel.text = viewModel.repoFullName
            ownerImageView.pin_setImage(from: viewModel.ownerImageURL, placeholderImage: R.image.github())
        }
    }
    
}
