//
//  OnboardingView.swift
//  WodTime
//
//  Created by Rey Felipe on 5/24/21.
//

import SwiftUI

struct OnboardingView: View {
    
    let totalPages = AppConstants.Onboarding.Timer.totalPages
    @AppStorage(AppConstants.Onboarding.Key.timer) var currentPage = 1
    
    var body: some View {
        // For Sliding Animation
        ZStack {
            //Change between views
            if (currentPage == 1) {
                OnboardScreenView(image: "timer",
                                  title: Strings.Onboarding.Timer.Title.page1,
                                  detail: Strings.Onboarding.Timer.Detail.page1,
                                  bgColor: AppConstants.Onboarding.UI.bgColor,
                                  maxPage: totalPages)
//                    .transition(.move(edge: .trailing).animation(.easeInOut(duration: 10)))
//                    .zIndex(1)
            }
            if (currentPage == 2) {
                OnboardScreenView(image: "clock",
                                  title: Strings.Onboarding.Timer.Title.page2,
                                  detail: Strings.Onboarding.Timer.Detail.page2,
                                  bgColor: AppConstants.Onboarding.UI.bgColor,
                                  maxPage: totalPages)
//                    .transition(.move(edge: .leading).animation(.easeInOut(duration: 10)))
//                    .zIndex(2)
            }
            if (currentPage == 3) {
                OnboardScreenView(image: "clock.arrow.circlepath",
                                  title: Strings.Onboarding.Timer.Title.page3,
                                  detail: Strings.Onboarding.Timer.Detail.page3,
                                  bgColor: AppConstants.Onboarding.UI.bgColor,
                                  maxPage: totalPages)
//                    .transition(.move(edge: .leading).animation(.easeInOut(duration: 10)))
//                    .zIndex(3)
            }
        }
        .overlay(
            Button(action: {
                withAnimation(.easeInOut) {
                    if currentPage <= totalPages {
                        currentPage += 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
                // circluar slider
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage)/CGFloat(totalPages))
                                .stroke(Color.white, lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-15)
                    )
                
            })
            .padding(.bottom, 20)
            , alignment: .bottom
        )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
