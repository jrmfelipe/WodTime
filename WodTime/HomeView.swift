//
//  HomeView.swift
//  WodTime
//
//  Created by Rey Felipe on 5/24/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()
                WTText("This is the home screen", kerning: 1.5)
                Spacer()
            }
            .navigationTitle(Strings.appName)
            //.background(Color.gray)
            .toolbar {
                NavigationLink(destination: AboutScreenView()) {
                    Button {
                        // TODO: show about screen here
                    } label: {
                        Label(Strings.about, systemImage: "info.circle")

                    }
                }
            }
            .accentColor(.blue)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()
    }
}
