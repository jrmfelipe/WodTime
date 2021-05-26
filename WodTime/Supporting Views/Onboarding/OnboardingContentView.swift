//
//  OnboardingContentView.swift
//  WodTime
//
//  Created by Rey Felipe on 5/26/21.
//

import SwiftUI

struct OnboardingContentView: View {
    
    var image: String
    var title: String
    var detail: String
    var moveLeft: Bool
    
    var body: some View {
        VStack {
            
            // Image
            Image(systemName:image)
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
        }
        .animation(.easeInOut(duration: 0.5))
//        .transition((moveLeft) ? .slideLeftToRight : .slideRightToLeft)
        .transition(.asymmetric(insertion: AnyTransition.move(edge: (moveLeft) ? .trailing : .leading),
                                removal: AnyTransition.move(edge:  (moveLeft) ? .leading : .trailing)))
    }
}

struct OnboardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContentView(image: "clock", title: "Test", detail: "Description", moveLeft: true)
    }
}
