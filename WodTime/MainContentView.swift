//
//  MainContentView.swift
//  WodTime
//
//  Created by Rey Felipe on 5/24/21.
//

import SwiftUI

struct MainContentView: View {
    
    let totalPages = AppConstants.Onboarding.Timer.totalPages
    @AppStorage(AppConstants.Onboarding.Key.timer) var currentPage = 1
    
    var body: some View {
        
        OnboardingScreenView(title: ["1", "2", "3"],
                             detail: ["Detail here .", "Detail here ..", "Detail here ..."],
                             image: ["timer", "clock", "clock.arrow.circlepath"])
       
//        if currentPage > totalPages {
//
//            HomeView()
//
//        } else {
//
//            OnboardingView()
//        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
