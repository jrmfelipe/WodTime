//
//  AppConstants.swift
//  WodTime
//
//  Created by Rey Felipe on 5/24/21.
//

import Foundation
import SwiftUI

struct AppConstants {
    
    struct Onboarding {
        struct Timer {
            static let totalPages = 3
        }
        struct Key {
            static let timer = "Onboarding.Timer.currentPage"
        }
        struct UI {
            static let bgColor = Color.gray.opacity(0.5)
        }
    }
}
