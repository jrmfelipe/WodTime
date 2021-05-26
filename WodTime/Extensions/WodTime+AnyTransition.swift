//
//  WodTime+AnyTransition.swift
//  WodTime
//
//  Created by Rey Felipe on 5/26/21.
//

import SwiftUI


// some how not working :( DELETE THIS
extension AnyTransition {
    static var slideLeftToRight: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
        let removal = AnyTransition.move(edge: .trailing)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static var slideRightToLeft: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
        let removal = AnyTransition.move(edge: .leading)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

//extension AnyTransition {
//    static var slideLeftToRight: AnyTransition { get {
//        AnyTransition.modifier(
//            active: SlideLeftToRightModifier(duration: 1.0),
//            identity: SlideLeftToRightModifier(duration: 1.0))
//        }
//    }
//    static var slideRightToLeft: AnyTransition { get {
//        AnyTransition.modifier(
//            active: SlideRightToLeftModifier(duration: 1.0),
//            identity: SlideRightToLeftModifier(duration: 1.0))
//        }
//    }
//}
//
//struct SlideLeftToRightModifier: ViewModifier {
//    let duration: Double
//    func body(content: Content) -> some View {
//        content.animation(.easeInOut(duration: duration))
//        content.transition(.asymmetric(insertion: AnyTransition.move(edge: .trailing),
//                            removal: AnyTransition.move(edge: .leading)))
//    }
//}
//
//struct SlideRightToLeftModifier: ViewModifier {
//    let duration: Double
//    func body(content: Content) -> some View {
//        content.animation(.easeInOut(duration: duration))
//        content.transition(.asymmetric(insertion: AnyTransition.move(edge: .leading),
//                            removal: AnyTransition.move(edge: .trailing)))
//    }
//}
