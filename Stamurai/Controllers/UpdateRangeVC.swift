//
//  UpdateRangeVC.swift
//  Stamurai
//
//  Created by Ashu Baweja on 18/05/20.
//  Copyright © 2020 Ashu Baweja. All rights reserved.
//

import UIKit

class UpdateRangeVC: UIViewController {

    @IBOutlet weak var minSliderLimitLabel: UILabel!
    @IBOutlet weak var maxSliderStartingLabel: UILabel!
    @IBOutlet weak var minValueLabel: UILabel!
    @IBOutlet weak var maxValueLabel: UILabel!
    @IBOutlet weak var minSlider: UISlider!
    @IBOutlet weak var maxSlider: UISlider!
    @IBOutlet weak var errorLabel: UILabel!
    
    var minSliderCurrentValue = 0
    var maxSliderCurrentValue = 9
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Update Range"
        
        minSlider.minimumValue = 0
        minSlider.maximumValue = 8
        minSlider.value = 0
        minValueLabel.text = "0"
        minSliderLimitLabel.text = "8"
        
        maxSlider.minimumValue = 8
        maxSlider.maximumValue = 9
        maxSlider.value = 9
        maxValueLabel.text = "9"
        maxSliderStartingLabel.text = "8"
    }
    
    @IBAction func minSliderAction(_ sender: Any) {
        minSliderCurrentValue = Int(round(minSlider.value))
        minValueLabel.text = String(describing: minSliderCurrentValue)
        maxSlider.minimumValue = Float(minSliderCurrentValue)
        maxSliderStartingLabel.text = "\(minSliderCurrentValue)"
    }
    
    @IBAction func maxSliderAction(_ sender: Any) {
        maxSliderCurrentValue = Int(round(maxSlider.value))
        maxValueLabel.text = String(describing: maxSliderCurrentValue)
    }
    
    @IBAction func updateBtnAction(_ sender: Any) {
        if maxSliderCurrentValue > minSliderCurrentValue {
            UserDefaultHelper.setMinRating(num: minSliderCurrentValue)
            UserDefaultHelper.setMaxRating(num: maxSliderCurrentValue)
            self.navigationController?.popViewController(animated: true)
        }
        else {
            errorLabel.isHidden = false
        }
    }
}
