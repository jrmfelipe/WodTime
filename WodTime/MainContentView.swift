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
                
                HomeView()
                
            } else {
    
                OnboardingScreenView(isPresented: $onboardingIsPresented,
                                     title: ["1", "2", "3"],
                                     detail: ["Detail here .", "Detail here ..", "Detail here ..."],
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
