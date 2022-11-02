//
//  YearSummary.swift
//  final_project
//
//  Created by Jianrong weng on 4/16/21.
//

import SwiftUI

struct YearSummary: View {
    @EnvironmentObject private var list: Bookkeeper
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let mons = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    
    var body: some View {
        ZStack {
            Image("Background").resizable()
                .scaledToFill().ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 10) {
                    Spacer()
                    Text("Total Spending Transactions: \n")
                        .font(.title).foregroundColor(Color.blue)
                        .fontWeight(.bold).offset(y: 60)
                        
                    HStack(alignment: .lastTextBaseline) {
                        ForEach(0..<12) { i in
                            BarView(report: list.report[months[i]]!, month: i)
                        }.offset(y: 80)
                    }
                    
                    HStack(alignment: .lastTextBaseline) {
                        ForEach(0..<4) { i in
                            Text(mons[i])
                            Text(String(format: "$%.2f", list.report[months[i]]! - 1))
                        }
                    }.offset(y: 80)
                    
                    HStack(alignment: .lastTextBaseline) {
                        ForEach(4..<8) { i in
                            Text(mons[i])
                            Text(String(format: "$%.2f", list.report[months[i]]! - 1))
                        }
                    }.offset(y: 80)
                    
                    HStack(alignment: .lastTextBaseline) {
                        ForEach(8..<12) { i in
                            Text(mons[i])
                            Text(String(format: "$%.2f", list.report[months[i]]! - 1))
                        }
                    }.offset(y: 80)
                    
                }
            }
        }
        
    }
}

struct BarView: View {
    let report : Double
    let month: Int
    
    
    var body: some View {
        let value = report / 500
        let yValue = Swift.min(value * 200, 500)
        
        return VStack{
            Rectangle().fill(Color(red: 0.5, green: 0.7, blue: 1, opacity: 1.0)).frame(width: 25, height: CGFloat(yValue))
            Text(String(month + 1))
        }
    }
}

struct YearSummary_Previews: PreviewProvider {
    static var previews: some View {
        YearSummary()
    }
}
