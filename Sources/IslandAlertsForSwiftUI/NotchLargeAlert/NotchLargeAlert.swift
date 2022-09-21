//
//  NotchLargeAlert.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import Foundation
import SwiftUI

public struct NotchLargeAlert: ViewModifier {
    
    @Binding var isPresented: Bool
    let title: String
    let message: String
    let action: () -> ()
    
    public func body(content: Content) -> some View {
        ZStack {
            VStack {
                
                VStack {
                    
                    if isPresented {
                        Group {
                            
                            Text(title).font(.headline)
                            
                            Text(message)
                                .lineLimit(3)
                                .padding(.top, 5)
                                .padding(.horizontal, 20)
                            
                        }.foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        
                        HStack {
                            Button(role: .destructive, action: {
                                withAnimation {
                                    isPresented.toggle()
                                }
                            }) {
                                Text("Cancel").frame(maxWidth: 100)
                            }
                            .buttonStyle(.borderedProminent)
                            .cornerRadius(10)
                            .padding(2)
                            
                            Button(action: {}) {
                                Text("Confirm").frame(maxWidth: 100)
                            }
                            .buttonStyle(.borderedProminent)
                            .cornerRadius(10)
                            .padding(2)
                        }
                        
                    }
                    
                }
                .islandAnimation(isPresented: $isPresented)
                .notchLargeFrame(isPresented: $isPresented)
                .background(Rectangle()
                    .notchLargeFrame(isPresented: $isPresented)
                    .foregroundColor(Color.black)
                    .cornerRadius(isPresented ? 20:30, corners: [.bottomLeft, .bottomRight])
                    .padding(.bottom, isPresented ? 10:0))
                
                
                Spacer()
                
            }.edgesIgnoringSafeArea(.vertical)
                
            content
            
        }
    }
}

extension View {
    /// A large alert expanding from the top notch
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the alert. When the user presses or taps one of the Cancel action, the system sets this value to false and dismisses.
    ///   - title: A text string used as the title of the alert.
    ///   - message: A text string used as the message of the alert, maximum 3 lines of text after which it is truncated
    ///   - action: function performed when the Confirm button is pressed
    public func notchLargeAlert(isPresented: Binding<Bool>, title: String, message: String, action: @escaping () -> ()) -> some View {
        ModifiedContent(content: self, modifier: NotchLargeAlert(isPresented: isPresented, title: title, message: message, action: action))
    }
}

struct NotchLargeAlertDebug_Previews: PreviewProvider {
    static var previews: some View {
        NotchLargeAlertExample()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}
