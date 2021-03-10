//
//  FructusApp.swift
//  Fructus
//
//  Created by Jacob LeCoq on 3/7/21.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if(isOnboarding){
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
