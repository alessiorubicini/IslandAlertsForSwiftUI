//
//  DynamicIsland.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import Foundation
import SwiftUI

private class DynamicIsland {
    
    static let width: CGFloat = 125
    static let heigth: CGFloat = 35
    
    private init() {}
    
    static var islandExpandedSize: CGFloat {
        UIDevice.modelName.contains("Pro Max") ? 400 : 360
    }
    
    struct IslandLargeFrame: ViewModifier {
        @Binding var isPresented: Bool
        func body(content: Content) -> some View {
            content
                .frame(width: isPresented ? DynamicIsland.islandExpandedSize:DynamicIsland.width, height: isPresented ? 200:DynamicIsland.heigth)
        }
    }
    
    struct IslandMediumFrame: ViewModifier {
        @Binding var isPresented: Bool
        func body(content: Content) -> some View {
            content
                .frame(width: isPresented ? DynamicIsland.islandExpandedSize:DynamicIsland.width, height: isPresented ? 90:DynamicIsland.heigth)
        }
    }
    
    struct IslandSquareFrame: ViewModifier {
        @Binding var isPresented: Bool
        func body(content: Content) -> some View {
            content
                .frame(width: isPresented ? 140:DynamicIsland.width, height: isPresented ? 140:DynamicIsland.heigth)
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
