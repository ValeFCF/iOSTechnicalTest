//
//  MovieTableViewCell.swift
//  iOSTechnicalTest
//
//  Created by Emmanuel Valentín Granados López on 5/19/19.
//  Copyright © 2019 Emmanuel Valentín Granados López. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblVoteAverage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
