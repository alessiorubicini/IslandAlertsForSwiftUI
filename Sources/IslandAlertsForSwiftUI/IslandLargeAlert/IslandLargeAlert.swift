//
//  IslandLargeAlert.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import Foundation
import SwiftUI

public struct IslandLargeAlert: ViewModifier {
    
    @Binding var isPresented: Bool
    let title: String
    let message: String
    
    public func body(content: Content) -> some View {
        ZStack {
            VStack {
                
                VStack {
                    
                    if isPresented {
                        Group {
                            
                            Text(title).font(.headline)
                                .padding(.top, 30)
                            
                            Text(message)
                                .padding(.top, 5)
                                .padding(.horizontal, 30)
                            
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
                            .cornerRadius(15)
                            .padding(5)
                            
                            Button(action: {}) {
                                Text("Confirm").frame(maxWidth: 100)
                            }
                            .buttonStyle(.borderedProminent)
                            .cornerRadius(15)
                            .padding(5)
                        }
                        
                    }
                    
                }
                .islandLargeFrame(isPresented: $isPresented)
                .background(Rectangle()
                    .islandLargeFrame(isPresented: $isPresented)
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
    public func islandLargeAlert(isPresented: Binding<Bool>, title: String, message: String) -> some View {
        ModifiedContent(content: self, modifier: IslandLargeAlert(isPresented: isPresented, title: title, message: message))
    }
}

struct IslandLargeAlertDebug_Previews: PreviewProvider {
    static var previews: some View {
        IslandLargeAlertExample()
    }
}
