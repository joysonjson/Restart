//
//  ContentView.swift
//  first
//
//  Created by Joyson P S on 23/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingActive : Bool = true
    
    var body: some View {
        if isOnboardingActive {
            OnboardingView()
        }else{
            HomeScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
