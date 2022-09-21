//
//  IslandMediumAlert.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import Foundation
import SwiftUI

public struct IslandMediumAlert: ViewModifier {
    
    @Binding var isPresented: Bool
    let systemIcon: String
    let title: String

    public func body(content: Content) -> some View {
        ZStack {
            VStack {
                HStack {
                    
                    if isPresented {
                        
                        Image(systemName: self.systemIcon)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                        
                        Spacer()
                        
                        Text(title).font(.headline)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                            .padding(.top, 30)
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                isPresented.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                                .symbolRenderingMode(.hierarchical)
                                .padding(.horizontal, 20)
                                .padding(.top, 20)
                        }

                        
                    }
                    
                }
                .islandAnimation(isPresented: $isPresented)
                .islandMediumFrame(isPresented: $isPresented)
                .background(Rectangle()
                    .islandMediumFrame(isPresented: $isPresented)
                    .foregroundColor(Color.black)
                    .cornerRadius(isPresented ? 40 : 20)
                    .padding(.top, 22))
                Spacer()
                
            }.edgesIgnoringSafeArea(.vertical)
                
            content
            
        }
    }
}

extension View {
    /// A medium-size alert expanding into a top rectangle from the Dynamic Island
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the alert. When the user presses or taps one of the Cancel action, the system sets this value to false and dismisses.
    ///   - systemIcon: The name of the system symbol image. Use the SF Symbols app to look up the names of system symbol images.
    ///   - text: A text string used as the text of the alert.
    public func islandMediumAlert(isPresented: Binding<Bool>, systemIcon: String, title: String) -> some View {
        ModifiedContent(content: self, modifier: IslandMediumAlert(isPresented: isPresented, systemIcon: systemIcon, title: title))
    }
}

struct IslandMediumAlertDebug_Previews: PreviewProvider {
    static var previews: some View {
        IslandMediumAlertExample()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
    }
}
