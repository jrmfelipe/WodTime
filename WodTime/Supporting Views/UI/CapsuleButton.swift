//
//  CapsuleButton.swift
//  WodTime
//
//  Created by Rey Felipe on 5/26/21.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.5) : foregroundColor
        return configuration.label
            .padding()
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.5) : backgroundColor)
            // This is the key part, we are using both an overlay as well as cornerRadius
            //.cornerRadius(6)
            .clipShape(Capsule())
            //.overlay(
            //    RoundedRectangle(cornerRadius: 25)
            //        .stroke(currentForegroundColor, lineWidth: 2)
        //)
            .padding([.top, .bottom], 10)
            .font(Font.system(size: 19, weight: .semibold))
    }
}

struct CapsuleButton: View {
    
    private static let buttonHorizontalMargins: CGFloat = 20
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    private let title: String
    private let systemImage: String
    private let action: () -> Void
    
    // It would be nice to make this into a binding.
    private let disabled: Bool
    
    init(title: String,
         systemImage: String = "",
         disabled: Bool = false,
         backgroundColor: Color = Color.green,
         foregroundColor: Color = Color.white,
         action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.action = action
        self.disabled = disabled
        self.systemImage = systemImage
    }
    
    var body: some View {
        HStack {
            //Spacer(minLength: CapsuleButton.buttonHorizontalMargins)
            Button(action:self.action) {
                HStack {
                    if !systemImage.isEmpty {
                        Image(systemName: "chevron.left")
                            .foregroundColor(foregroundColor)
                            .font(.title2)
                    }
                    if !title.isEmpty {
                        Text(self.title)
                            .font(.title2)
                    }
                }
            }
            .buttonStyle(CapsuleButtonStyle(backgroundColor: backgroundColor,
                                          foregroundColor: foregroundColor,
                                          isDisabled: disabled))
            .disabled(self.disabled)
            .clipShape(Capsule())
            //Spacer(minLength: CapsuleButton.buttonHorizontalMargins)
        }
        //.frame(maxWidth:.infinity)
    }
}

struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CapsuleButton(title: "Back",
                          systemImage: "chevron",
                          backgroundColor: Color.green,
                          foregroundColor: Color.white) {
                print("Hello World")
            }
            //.padding([.top, .bottom, .leading, .trailing], 0)
            //.background(Color.yellow)
            CapsuleButton(title: "Disabled",
                          disabled: true,
                          backgroundColor: Color.green,
                          foregroundColor: Color.white) {
                print("Hello World")
            }
        }
        //.background(Color.red)
    }
}
