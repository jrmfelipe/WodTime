//
//  OnboardingScreenView.swift
//  WodTime
//
//  Created by Rey Felipe on 5/25/21.
//

import SwiftUI

struct OnboardingScreenView: View {
    
    @Binding var isPresented: Bool
    
    @State private var currentPage = 0
    @State private var previousPage = 0
    
    var title: [String]
    var detail: [String]
    var image: [String]
    var totalPages: Int
    
    var body: some View {
        
        if (totalPages != title.count) &&
            (totalPages != detail.count) &&
            (totalPages != image.count) {
            
            VStack {
                Text("Error")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                Text("Please check the parameters (OnboardingScreenView)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
        } else {
        
            // For Sliding Animation
            ZStack {
                VStack(spacing: 20) {
                    
                    HStack {
                        if (currentPage == 0) {
                            // Show only on the 1st page
                            Text(Strings.appName)
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
                                // Dismiss this screen
                                isPresented = false
                            }
                        }, label: {
                            Text(Strings.skip)
                                .fontWeight(.semibold)
                                .kerning(1.2)
                        })
                    }
                    .frame(height: 40.0)
                    .foregroundColor(.black)
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
                            } else {
                                // At the end of the page, dismiss the screen
                                isPresented = false
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
}

struct OnboardingScreenView_Previews: PreviewProvider {
    @State static var isPresented = false
    
    static var previews: some View {
        OnboardingScreenView(isPresented: $isPresented,
                             title: ["1", "2", "3"],
                             detail: ["Detail here .", "Detail here ..", "Detail here ..."],
                             image: ["timer", "clock", "clock.arrow.circlepath"],
                             totalPages: 2)
    }
}
