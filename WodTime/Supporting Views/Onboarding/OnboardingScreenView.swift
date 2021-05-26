//
//  OnboardingScreenView.swift
//  WodTime
//
//  Created by Rey Felipe on 5/25/21.
//

import SwiftUI

struct OnboardingScreenView: View {
    
    @State private var currentPage = 0
    @State private var previousPage = 0
    
    var title: [String]
    var detail: [String]
    var image: [String]
    
    var body: some View {
        // For Sliding Animation
        ZStack {
        VStack(spacing: 20) {
            
            HStack {
                if (currentPage == 0) {
                    // Show only on the 1st page
                    Text("Header")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                        .transition(.slideRightToLeft)
                } else {
                    
                    SystemImageCircleButton(systemImage: "chevron.left",
                                            backgroundColor: Color.gray,
                                            foregroundColor: Color.white) {
                        withAnimation {
                            if currentPage > 0 {
                                previousPage = currentPage
                                currentPage -= 1
                                if (currentPage == 0) {
                                    previousPage = currentPage
                                }
                            }
                        }
                    }
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        //TODO: Dismiss this screen
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }
            .frame(height: 40.0)
            .foregroundColor(.black)
            //.background(Color.red)
            .padding()
    
            Spacer(minLength: 0)
            
            if (previousPage < currentPage) {
                
                OnboardingContentView(image: image[currentPage],
                                      title: title[currentPage],
                                      detail: detail[currentPage],
                                      moveLeft: true)
                
            } else if (previousPage > currentPage) {
                
                OnboardingContentView(image: image[currentPage],
                                      title: title[currentPage],
                                      detail: detail[currentPage],
                                      moveLeft: false)
                
            } else if (currentPage == 2) {
                
                OnboardingContentView(image: image[currentPage],
                                      title: title[currentPage],
                                      detail: detail[currentPage],
                                      moveLeft: true)
                
            }  else if (currentPage == 0) {
                
                OnboardingContentView(image: image[currentPage],
                                      title: title[currentPage],
                                      detail: detail[currentPage],
                                      moveLeft: false)
            }
            
            
            Spacer()
            
            Button(action: {
                withAnimation(.easeInOut(duration: 1.0)) {
                    if currentPage < (title.count-1) {
                        previousPage = currentPage
                        currentPage += 1
                        if (currentPage == (title.count-1)) {
                            previousPage = currentPage
                        }
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Color.green)
                    .clipShape(Circle())
                    // circluar slider
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(Color.black.opacity(0.05), lineWidth: 4)
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage+1)/CGFloat(title.count))
                                .stroke(Color.green, lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-8)
                    )
                
            })
            .padding(.bottom, 20)
            
            Spacer()
        }
        //.background(Color.blue)
        }
    }
}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView(title: ["1", "2", "3"],
                             detail: ["Detail here .", "Detail here ..", "Detail here ..."],
                             image: ["timer", "clock", "clock.arrow.circlepath"])
    }
}
