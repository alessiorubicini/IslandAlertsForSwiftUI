//
//  DynamicIsland.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import Foundation
import SwiftUI

class DynamicIsland {
    
    static let standardWidth: CGFloat = 125
    static let standardHeigth: CGFloat = 35
    
    private init() {}
    
    static var islandExpandedSize: CGFloat {
        UIDevice.modelName.contains("Pro Max") ? 400 : 360
    }
    
    struct IslandLargeFrame: ViewModifier {
        @Binding var isPresented: Bool
        func body(content: Content) -> some View {
            content
                .frame(width: isPresented ? DynamicIsland.islandExpandedSize :125, height: isPresented ? 200:35)
        }
    }
    
    struct IslandMediumFrame: ViewModifier {
        @Binding var isPresented: Bool
        func body(content: Content) -> some View {
            content
                .frame(width: isPresented ? DynamicIsland.islandExpandedSize :125, height: isPresented ? 90:35)
        }
    }
    
    struct IslandSquareFrame: ViewModifier {
        @Binding var isPresented: Bool
        func body(content: Content) -> some View {
            content
                .frame(width: isPresented ? 140:125, height: isPresented ? 140:35)
        }
    }
}

extension View {
    func islandLargeFrame(isPresented: Binding<Bool>) -> some View {
        ModifiedContent(content: self, modifier: DynamicIsland.IslandLargeFrame(isPresented: isPresented))
    }
    func islandMediumFrame(isPresented: Binding<Bool>) -> some View {
        ModifiedContent(content: self, modifier: DynamicIsland.IslandMediumFrame(isPresented: isPresented))
    }
    func islandSquareFrame(isPresented: Binding<Bool>) -> some View {
        ModifiedContent(content: self, modifier: DynamicIsland.IslandSquareFrame(isPresented: isPresented))
    }
}
