//
//  final_projectApp.swift
//  final_project
//
//  Created by Fay Liu on 3/18/21.
//

import SwiftUI

@main
struct final_projectApp: App {
    @StateObject private var bookkeeper = Bookkeeper()
    
    var body: some Scene {
        WindowGroup {
            MainPage().environmentObject(bookkeeper)
        }
    }
}
