//
//  PullRequestCell.swift
//  GitRepos2
//
//  Created by Douglas Barbosa on 04/01/17.
//  Copyright © 2017 helabs. All rights reserved.
//

import UIKit
import PINRemoteImage

class PullRequestCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var viewModel: PullRequestItemViewModel! {
        didSet {
            titleLabel.text = viewModel.title
            bodyLabel.text = viewModel.body
            usernameLabel.text = viewModel.userLogin
            avatarImageView.pin_setImage(from: viewModel.avatarURL, placeholderImage: R.image.github())
            dateLabel.text = viewModel.date
        }
    }
    
}
