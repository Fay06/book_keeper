//
//  ListView.swift
//  final_project
//
//  Created by Jianrong weng on 4/16/21.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject private var list: Bookkeeper
    
    var body: some View {
        ZStack{
            Image("Background").resizable()
                .scaledToFill().ignoresSafeArea()
            
            ScrollView {
                
                Text("Spending")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
                    .padding()
                    .offset(y: 50)
                    
                Spacer()
                
                ForEach(list.list) { order in
                    if order.isEarning == false {
                        Text("\(order.toString())").offset(y: 50)
                    }
                }
                
                Text("Earning")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    .padding()
                    .offset(y: 50)
                
                Spacer()
                
                ForEach(list.list) { order in
                    if order.isEarning == true {
                        Text("\(order.toString())").offset(y: 50)
                    }
                }
            }
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
