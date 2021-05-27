//
//  OnboardScreenView.swift
//  WodTime
//
//  Created by Rey Felipe on 5/24/21.
//

import SwiftUI

struct OnboardScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    var maxPage: NSInteger
    
    @AppStorage(AppConstants.Onboarding.Timer.curPage) var currentPage = 0
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                if (currentPage == 1) {
                    // Show only on the 1st page
                    Text(Strings.appName)
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                } else {
                    // Back Button shown
                    Button(action: {
                        withAnimation(.easeInOut) {
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        currentPage = maxPage+1
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            
            // Image
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
            // Title
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            // Detail
            Text(detail)
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 120)
        }
        .background(bgColor.cornerRadius(10).ignoresSafeArea())
    }
}

struct OnboardScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardScreenView(image: "timer", title: "Page 1", detail: "Detail 1", bgColor: .gray, maxPage: 1)
    }
}
