//
//  ComparePage.swift
//  final_project
//
//  Created by Jianrong weng on 4/15/21.
//

import SwiftUI

struct ComparePage: View {
    
    @State var month1 = 0
    @State var month2 = 0
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Background").resizable()
                    .scaledToFill().ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Text("Compare Transcations")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .padding().offset(y:-30)
                    

                    Text("Choose the first month: ").font(.title3).italic().offset(y:-20)
                    Picker(selection: $month1, label: Text("Month1")
                            .font(.body)) {
                        ForEach(0 ..< months.count) { index in
                            Text(self.months[index]).tag(index)
                        }
                    }.frame(width: 10, height: 150, alignment: .center).offset(y:-20)
                    
                    Text("Choose the second month: ").font(.title3).italic().offset(y:-30)
                    Picker(selection: $month2, label: Text("Month2")
                            .font(.body)) {
                        ForEach(0 ..< months.count) { index in
                            Text(self.months[index]).tag(index)
                        }
                    }.frame(width: 10, height: 150, alignment: .center).offset(y:-30)
                    
                    
                    
                    NavigationLink(destination: CompareView(month1: month1, month2: month2)) {
                        Text("Compare")
                    }.offset(y:-20)

                }
            }
            
        }
        
    }
}

struct CompareView: View {
    @EnvironmentObject private var bookkeeper: Bookkeeper
    var month1: Int
    var month2: Int
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    var body: some View {
        ScrollView {
            Text("\(months[month1])\t\t\t\(months[month2])")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Spacer()
            VStack(spacing: 20) {
            Text("Food: $\(bookkeeper.hash[month1]["Food"]!.description) \t\tFood: $\(bookkeeper.hash[month2]["Food"]!.description)")
            Text("Cloth: $\(bookkeeper.hash[month1]["Cloth"]!.description) \t\tCloth: $\(bookkeeper.hash[month2]["Cloth"]!.description)")
            Text("Transportation: $\(bookkeeper.hash[month1]["Transportation"]!.description) \t\tTransportation: $\(bookkeeper.hash[month2]["Transportation"]!.description)")
            Text("Housing: $\(bookkeeper.hash[month1]["Housing"]!.description) \t\t\tHousing: $\(bookkeeper.hash[month2]["Housing"]!.description)")
            Text("Entertainment: $\(bookkeeper.hash[month1]["Entertainment"]!.description) \t\tEntertainment: $\(bookkeeper.hash[month2]["Entertainment"]!.description)")
            }
        }
    }
}

struct ComparePage_Previews: PreviewProvider {
    static var previews: some View {
        ComparePage()
    }
}
