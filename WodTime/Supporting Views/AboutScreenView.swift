//
//  AboutScreenView.swift
//  WodTime
//
//  Created by Rey Felipe on 5/30/21.
//

import SwiftUI

struct AboutScreenView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Label("", systemImage: "chevron.left")
                .padding([.leading, .bottom], 7)
                .padding(.top, 5)
                .foregroundColor(AppConstants.AppColor.Link.navigation)
                .background(AppConstants.AppColor.Link.navigation.opacity(0.25))
                .clipShape(Circle())
        }
    }
    
    var body: some View {
        VStack {
            Text("About Screen")
        }
        .navigationBarTitle(Strings.about, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct AboutScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreenView()
    }
}
