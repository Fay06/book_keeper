//
//  bookkeeper.swift
//  final_project
//
//  Created by Fay Liu on 3/18/21.
//

import Foundation

class Bookkeeper : ObservableObject {
    @Published var balance: Double
    @Published var list: [Transcation]
    @Published var hash: [[String: Double]]
    @Published var report: [String: Double]
    
    init() {
        balance = 0;
        list = []
        hash = [[String: Double]]()
        report = ["January" : 1.0,
        "February" : 1.0,
        "March" : 1.0,
        "April" : 1.0,
        "May" : 1.0,
        "June" : 1.0,
        "July" : 1.0,
        "August" : 1.0,
        "September" : 1.0,
        "October" : 1.0,
        "November" : 1.0,
        "December" : 1.0]
        let month : [String: Double] = ["Food": 0.0,
                                        "Cloth" : 0.0,
                                        "Transportation" : 0.0,
                                        "Housing": 0.0,
                                        "Entertainment": 0.0]
        for _ in 1...12 {
            hash.append(month)
        }
    }
    
    func spending(cost: Double) {
        balance -= cost
    }
    
    func earning(money: Double) {
        balance += money
    }
    
    func addTranscation(_ transcation: Transcation) {
        list.append(transcation)
    }
    
    func balanceFormat() -> String {
        return String(format: "%.2f", balance)
    }
    
    func mostSpent(_ i:Int) -> String {
        var str = "You spent the most on category "
        var max = 0.0
        var category = ""
        if (i < 0 || i > 11) {
            return "None"
        }
        for (key,value) in hash[i] {
            if (value > max) {
                max = value
                category = key
            }
        }
        if (max == 0.0) {
            str += "None"
        }
        else {
            str += category
        }
        return str
    }
    
    
    func toString(_ i: Int) -> String {
        var str = ""
        if (i == 1) {
            str.append("Jan : \(hash[i - 1]) \n")
        } else if (i == 2) {
            str.append("Feb : \(hash[i - 1]) \n")
        } else if (i == 3) {
            str.append("Mar : \(hash[i - 1]) \n")
        } else if (i == 4) {
            str.append("Apr : \(hash[i - 1]) \n")
        } else if (i == 5) {
            str.append("May : \(hash[i - 1]) \n")
        } else if (i == 6) {
            str.append("Jun : \(hash[i - 1]) \n")
        } else if (i == 7) {
            str.append("Jul : \(hash[i - 1]) \n")
        } else if (i == 8) {
            str.append("Aug : \(hash[i - 1]) \n")
        } else if (i == 9) {
            str.append("Sep : \(hash[i - 1]) \n")
        } else if (i == 10) {
            str.append("Oct : \(hash[i - 1]) \n")
        } else if (i == 11) {
            str.append("Nov : \(hash[i - 1]) \n")
        } else if (i == 12) {
            str.append("Dec : \(hash[i - 1]) \n")
        }
        
        return str
        
    }
}
