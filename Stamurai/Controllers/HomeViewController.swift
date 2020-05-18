//
//  ViewController.swift
//  Stamurai
//
//  Created by Ashu Baweja on 18/05/20.
//  Copyright © 2020 Ashu Baweja. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var rangeBtn: UIButton!
    var minRating = 0
    var maxRating = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        let updatRangeBtn = UIBarButtonItem(title: "Update Range", style: .plain, target: self, action: #selector(HomeViewController.updateRangeAction))
        self.navigationItem.leftBarButtonItem = updatRangeBtn
        
        let historyBtn = UIBarButtonItem(title: "History", style: .plain, target: self, action: #selector(HomeViewController.historyAction))
        self.navigationItem.rightBarButtonItem = historyBtn
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        minRating = UserDefaultHelper.getMinRating()
        maxRating = UserDefaultHelper.getMaxRating()
        
        rangeBtn.setTitle("\(minRating)-\(maxRating)", for: .normal)
    }
    
    @objc func updateRangeAction(){
        let updateRangeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UpdateRangeVC")
        self.navigationController?.pushViewController(updateRangeVC, animated: true)
    }
    
    @objc func historyAction(){
        let historyVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HistoryVC")
        self.navigationController?.pushViewController(historyVC, animated: true)
    }
    
    @IBAction func rangeBtnAction(_ sender: Any) {
        if let ratingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RatingVC") as? RatingVC {
            ratingVC.minRating = minRating
            ratingVC.maxRating = maxRating
            self.navigationController?.pushViewController(ratingVC, animated: true)
        }
    }
}

