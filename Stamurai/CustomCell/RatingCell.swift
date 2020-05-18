//
//  RatingCell.swift
//  Stamurai
//
//  Created by Ashu Baweja on 18/05/20.
//  Copyright © 2020 Ashu Baweja. All rights reserved.
//

import UIKit

class RatingCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    func configureUserCell(rating: String){
        let ratingData = rating.split(separator: "-")
        ratingLabel.text = String(ratingData[1])
        dateLabel.text = String(ratingData[0])
    }
}
