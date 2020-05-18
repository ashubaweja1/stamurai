//
//  RatingVC.swift
//  Stamurai
//
//  Created by Ashu Baweja on 18/05/20.
//  Copyright © 2020 Ashu Baweja. All rights reserved.
//

import UIKit

class RatingVC: UIViewController {
    
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var minRating = 0
    var maxRating = 0
    var currentValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rate Us"
        
        minLabel.text = "\(minRating)"
        maxLabel.text = "\(maxRating)"
        currentValueLabel.text = "\(maxRating)"
        slider.minimumValue = Float(minRating)
        slider.maximumValue = Float(maxRating)
        slider.value = Float(maxRating)
        currentValue = maxRating
    }
    
    @IBAction func submitBtnnAction(_ sender: Any) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy | hh:mm a"
        let dateString = dateFormatter.string(from: date)
    
        let rating = "\(dateString)-\(currentValue)"
        UserDefaultHelper.saveRating(rating: rating)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sliderActionn(_ sender: UISlider) {
        currentValue = Int(round(slider.value))
        currentValueLabel.text = String(describing: currentValue)
    }
    
}
