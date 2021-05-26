//
//  SystemImageCircleButton.swift
//  WodTime
//
//  Created by Rey Felipe on 5/26/21.
//

import SwiftUI

struct SystemImageCircleButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.5) : foregroundColor
        return configuration.label
            .padding(10)
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.5) : backgroundColor)
            .clipShape(Circle())
            .padding([.top, .bottom], 10)
            .font(Font.system(size: 19, weight: .semibold))
    }
}

struct SystemImageCircleButton: View {
    
    private static let buttonHorizontalMargins: CGFloat = 20
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    private let systemImage: String
    private let action: () -> Void
    
    // It would be nice to make this into a binding.
    private let disabled: Bool
    
    init(systemImage: String,
         disabled: Bool = false,
         backgroundColor: Color = Color.green,
         foregroundColor: Color = Color.white,
         action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.action = action
        self.disabled = disabled
        self.systemImage = systemImage
    }
    
    var body: some View {
        HStack {
            Button(action:self.action) {
                HStack {
                    Image(systemName: systemImage)
                        .foregroundColor(foregroundColor)
                        .font(.title)
                }
            }
            .buttonStyle(SystemImageCircleButtonStyle(backgroundColor: backgroundColor,
                                                      foregroundColor: foregroundColor,
                                                      isDisabled: disabled))
            .disabled(self.disabled)
            .clipShape(Circle())
        }
    }
}

struct SystemImageCircleButton_Previews: PreviewProvider {
    static var previews: some View {
        SystemImageCircleButton(systemImage: "clock",
                                backgroundColor: Color.green,
                                foregroundColor: Color.white) {
            print("Hello World")
        }
    }
}
