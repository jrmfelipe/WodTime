//
//  AppConstants.swift
//  WodTime
//
//  Created by Rey Felipe on 5/24/21.
//

import Foundation
import SwiftUI

struct AppConstants {
    
    struct AppColor {
        struct Link {
            static let navigation = Color.blue // navigation bar link color icons/text
        }
            
    }
    
    struct Onboarding {
        struct Timer {
            static let wasPresented = "Onboarding.Timer.WasPresented"
            static let curPage = "Onboarding.Timer.curPage"
        }
        struct UI {
            static let bgColor = Color.gray.opacity(0.5)
        }
    }
}
