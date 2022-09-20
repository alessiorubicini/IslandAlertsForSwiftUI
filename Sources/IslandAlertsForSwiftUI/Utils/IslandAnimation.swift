//
//  File.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import Foundation
import SwiftUI

public struct IslandAnimation: ViewModifier {
    
    @Binding var isPresented: Bool
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isPresented ? 1 : 0, anchor: .topLeading)
            .blur(radius: isPresented ? 0: 10)
    }
}

extension View {
    // Pop and blur animation for Dynamic Island shrinking
    public func islandAnimation(isPresented: Binding<Bool>) -> some View {
        ModifiedContent(content: self, modifier: IslandAnimation(isPresented: isPresented))
    }
}
