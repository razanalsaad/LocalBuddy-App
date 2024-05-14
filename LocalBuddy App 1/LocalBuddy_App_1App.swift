//
//  LocalBuddy_App_1App.swift
//  LocalBuddy App 1
//
//  Created by razan on 30/04/2024.
//

import SwiftUI

@main
struct LocalBuddy: App {
   @StateObject var vm = UserViewModel()
    @StateObject var viewModel = ActivityViewModel()
    var body: some Scene {
        WindowGroup {
            ActivityForm()
           .environmentObject(vm)
           .environmentObject(viewModel)
        }
    }
}
