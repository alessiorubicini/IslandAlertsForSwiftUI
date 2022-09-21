//
//  NotchMediumAlert.swift
//  
//
//  Created by Alessio Rubicini on 21/09/22.
//

import Foundation
import SwiftUI

struct NotchMediumAlert: ViewModifier {
    
    @Binding var isPresented: Bool
    let systemIcon: String
    let title: String
    
    public func body(content: Content) -> some View {
        ZStack {
            VStack {
                VStack {
                    
                    if isPresented {
                        
                        Group {
                            Image(systemName: self.systemIcon)
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.top, 20)
                            
                            Text(title).font(.headline)
                                .foregroundColor(.gray)
                                .lineLimit(1)
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 20)
                        }
                        .onTapGesture {
                            withAnimation {
                                isPresented.toggle()
                            }
                        }
                    }
                    
                }
                .islandAnimation(isPresented: $isPresented)
                .notchMediumFrame(isPresented: $isPresented)
                .background(Rectangle()
                    .notchMediumFrame(isPresented: $isPresented)
                    .foregroundColor(Color.black)
                    .cornerRadius(isPresented ? 20:30)
                    .padding(.bottom, isPresented ? 10:0))
                
                Spacer()
                
            }.edgesIgnoringSafeArea(.vertical)
                
            content
            
        }
    }
}

extension View {
    /// A medium-size alert expanding into a top rectangle from the notch
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the alert. When the user presses or taps one of the Cancel action, the system sets this value to false and dismisses.
    ///   - systemIcon: The name of the system symbol image. Use the SF Symbols app to look up the names of system symbol images.
    ///   - text: A text string used as the text of the alert.
    public func notchMediumAlert(isPresented: Binding<Bool>, systemIcon: String, title: String) -> some View {
        ModifiedContent(content: self, modifier: NotchMediumAlert(isPresented: isPresented, systemIcon: systemIcon, title: title))
    }
}

struct NotchMediumAlertDebug_Previews: PreviewProvider {
    static var previews: some View {
        NotchMediumAlertExample()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}
