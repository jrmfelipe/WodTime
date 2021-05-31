//
//  MainContentView.swift
//  WodTime
//
//  Created by Rey Felipe on 5/24/21.
//

import SwiftUI

struct MainContentView: View {
    
    @AppStorage(AppConstants.Onboarding.Timer.wasPresented) var wasPresented = false
    @State private var onboardingIsPresented = true
    
    var body: some View {
        VStack {
            
            if (wasPresented || !onboardingIsPresented) {
                NavigationView {
                    HomeView()
                        .animation(.easeInOut(duration: 0.5))
                        .transition(.scale)
                }
                
            } else {
                
                OnboardingScreenView(isPresented: $onboardingIsPresented,
                                     header: Strings.timer,
                                     title: ["Stop watch", "Countdown Timer", "Tabata"],
                                     detail: ["Referred use: Workout for Time", "Prefered use: As Many Round/Rep as possigle (AMRAP/AMREP)", "Prefered use: High Intensity Workouts and warmup routines"],
                                     image: ["timer", "clock", "clock.arrow.circlepath"],
                                     totalPages: 3)
                    .onChange(of: onboardingIsPresented, perform: { newValue in
                        wasPresented = true
                    })
                    .animation(.easeInOut(duration: 0.5))
                    .transition(.slideRightToLeft)
            }
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
