//
//  RottenMovieCell.swift
//  rottenTom
//
//  Created by Dianna on 10/2/14.
//  Copyright (c) 2014 dianna. All rights reserved.
//

import UIKit

class RottenMovieCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel
    @IBOutlet var synopsisLabel: UILabel
    @IBOutlet var posterView: UIImageView
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
