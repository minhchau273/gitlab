//
//  RepoCell.swift
//  GithubDemo
//
//  Created by Dave Vo on 9/3/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ownerLabel: UILabel!
    
    @IBOutlet weak var starLabel: UILabel!
    
    @IBOutlet weak var forkLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var avatarView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        descriptionLabel.preferredMaxLayoutWidth = descriptionLabel.frame.size.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        descriptionLabel.preferredMaxLayoutWidth = descriptionLabel.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
    }

}
