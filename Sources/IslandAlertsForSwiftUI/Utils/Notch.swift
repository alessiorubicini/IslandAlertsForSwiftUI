//
//  Notch.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import Foundation
import SwiftUI

private class Notch {
    
    private init() {}
    
    static var width: CGFloat {
        let bigNotchModels = ["X", "11", "12"]
        if bigNotchModels.first(where: {UIDevice.modelName.contains($0)}) != nil {
            return 210
        } else {
            return 160
        }
    }
    
    struct NotchLargeFrame: ViewModifier {
        @Binding var isPresented: Bool
        func body(content: Content) -> some View {
            content
                .frame(width: isPresented ? UIScreen.main.bounds.width : Notch.width-3, height: isPresented ? 210:30)
        }
    }
    
    struct NotchMediumFrame: ViewModifier {
        @Binding var isPresented: Bool
        func body(content: Content) -> some View {
            content
                .frame(width: isPresented ? Notch.width : Notch.width-2, height: isPresented ? 150:28)
        }
    }
}

extension View {
    func notchLargeFrame(isPresented: Binding<Bool>) -> some View {
        ModifiedContent(content: self, modifier: Notch.NotchLargeFrame(isPresented: isPresented))
    }
    func notchMediumFrame(isPresented: Binding<Bool>) -> some View {
        ModifiedContent(content: self, modifier: Notch.NotchMediumFrame(isPresented: isPresented))
    }
}
