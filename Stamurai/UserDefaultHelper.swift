//
//  UserDefaultHelper.swift
//  Stamurai
//
//  Created by Ashu Baweja on 18/05/20.
//  Copyright © 2020 Ashu Baweja. All rights reserved.
//

import Foundation

private let kMinRating = "MinRating"
private let kMaxRating = "MaxRating"
private let kAllRatings = "AllRatings"

class UserDefaultHelper {
    
    class func set(_ value : Any?, forkey key : String) {
        if let value = value {
            UserDefaults.standard.set(value, forKey: key)
        } else {
            UserDefaults.standard.removeObject(forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    class func get(_ key : String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    class func setMinRating(num: Int) {
        UserDefaultHelper.set(num, forkey: kMinRating)
    }
    
    class func getMinRating() -> Int {
        var minRating = 0
        if let rating = UserDefaultHelper.get(kMinRating) as? Int {
            minRating = rating
        }
        return minRating
    }
    
    class func setMaxRating(num: Int) {
        UserDefaultHelper.set(num, forkey: kMaxRating)
    }
    
    class func getMaxRating() -> Int {
        var maxRating = 9
        if let rating = UserDefaultHelper.get(kMaxRating) as? Int{
            maxRating = rating
        }
        return maxRating
    }
    
    class func saveRating(rating: String) {
        var allRatings = [String]()
        if let ratings = UserDefaultHelper.get(kAllRatings) as? [String] {
            allRatings = ratings
        }
        allRatings.append(rating)
        UserDefaultHelper.set(allRatings, forkey: kAllRatings)
    }
    
    class func getAllRatings() -> [String] {
        var allRatings = [String]()
        if let ratings = UserDefaultHelper.get(kAllRatings) as? [String] {
            allRatings = ratings
        }
        return allRatings
    }
}
