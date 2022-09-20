//
//  IslandSquareAlert.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import Foundation
import SwiftUI

public struct IslandSquareAlert: ViewModifier {
    @Binding var isPresented: Bool
    
    let systemIcon: String
    let text: String
    
    public func body(content: Content) -> some View {
        ZStack {
            VStack {
                VStack {
                    
                    if isPresented {
                        
                        Group {
                            Image(systemName: self.systemIcon)
                                .font(.system(size: 40))
                                .symbolRenderingMode(.multicolor)
                                .padding(.horizontal, 20)
                                .padding(.top, 40)
                            
                            Text(text).font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.top, 10)
                            
                            //Spacer()
                        }
                        .onTapGesture {
                            withAnimation {
                                isPresented.toggle()
                            }
                        }
                        
                    }
                    
                }
                .islandAnimation(isPresented: $isPresented)
                .islandSquareFrame(isPresented: $isPresented)
                .background(Rectangle()
                    .islandSquareFrame(isPresented: $isPresented)
                    .cornerRadius(isPresented ? 30 : 20)
                    .foregroundColor(Color.black)
                    .padding(.top, 22))
                
                Spacer()
                
            }.edgesIgnoringSafeArea(.vertical)
                
            content
            
        }
    }
}

extension View {
    /// A small-size alert expanding into a square from the Dynamic Island. It's dismissed by tapping on it.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the alert. When the user presses or taps one of the Cancel action, the system sets this value to false and dismisses.
    ///   - systemIcon: The name of the system symbol image. Use the SF Symbols app to look up the names of system symbol images.
    ///   - text: A text string used as the text of the alert.
    public func islandSquareAlert(isPresented: Binding<Bool>, systemIcon: String, text: String) -> some View {
        ModifiedContent(content: self, modifier: IslandSquareAlert(isPresented: isPresented, systemIcon: systemIcon, text: text))
    }
}

struct IslandSquareAlertDebug_Previews: PreviewProvider {
    static var previews: some View {
        IslandSquareAlertExample()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
    }
}
