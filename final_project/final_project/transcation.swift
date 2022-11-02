//
//  transcation.swift
//  final_project
//
//  Created by Jianrong weng on 3/18/21.
//

import Foundation

class Transcation: ObservableObject, Identifiable {
    @Published var name: String
    @Published var cost: Double
    @Published var category: String
    @Published var isEarning: Bool
    @Published var month: String
    @Published var monthtable: [String: String] = ["January" : "January: ",
    "February" : "February: ",
    "March" : "March: ",
    "April" : "April: ",
    "May" : "May: ",
    "June" : "June: ",
    "July" : "July: ",
    "August" : "August: ",
    "September" : "September: ",
    "October" : "October: ",
    "November" : "November: ",
    "December" : "December: "]
    
    init(_ cost: Double, _ name:String, _ category: String, _ isEarning: Bool, _ month: String) {
        self.cost = cost
        self.name = name
        self.category = category
        self.isEarning = isEarning
        self.month = month
        let str = "Type: Spending  Cost: \(cost)   The name of this order: \(name)   Category: \(category)   Month: \(month)"
        monthtable[month]?.append(str)
    }
    
    func toString() -> String {
        if (isEarning == true) {
            return "Cost: $\(cost)   Order Name: \(name)   Category: \(category)  Made on \(month)"
        } else {
            return "Cost: $\(cost)   Order Name: \(name)   Category: \(category)  Made on \(month)"
        }
    }
}
