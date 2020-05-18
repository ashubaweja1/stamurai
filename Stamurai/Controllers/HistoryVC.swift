//
//  HistoryVC.swift
//  Stamurai
//
//  Created by Ashu Baweja on 18/05/20.
//  Copyright © 2020 Ashu Baweja. All rights reserved.
//

import UIKit

let kRatingCell = "RatingCell"

class HistoryVC: UIViewController {
    @IBOutlet weak var historyTableView: UITableView!
    var allRatings = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rating History"
        
        let ratingCellNib = UINib(nibName: kRatingCell, bundle: nil)
        historyTableView.register(ratingCellNib, forCellReuseIdentifier: kRatingCell)
        allRatings = UserDefaultHelper.getAllRatings()
    }
}

//// MARK: UITableView Delegates & Datasource
extension HistoryVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRatings.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kRatingCell, for: indexPath)
        cell.selectionStyle = .none
        if let ratingCell = cell as? RatingCell {
            ratingCell.configureUserCell(rating: allRatings[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
}
