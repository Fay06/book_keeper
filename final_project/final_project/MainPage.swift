//
//  MainPage.swift
//  final_project
//
//  Created by Jianrong weng on 4/15/21.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        TabView {
            ContentView().tabItem {
                Label("Main Page", systemImage: "square.and.pencil")
            }
            ComparePage().tabItem {
                Label("Compare Page", systemImage: "doc.plaintext")
            }
            ListView().tabItem {
                Label("List View", systemImage: "list.dash")
            }
            YearSummary().tabItem {
                Label("Year Summary", systemImage: "folder")
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
