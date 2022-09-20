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
    let message: String

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
    public func islandMediumAlert(isPresented: Binding<Bool>, systemIcon: String, title: String, message: String) -> some View {
        ModifiedContent(content: self, modifier: IslandMediumAlert(isPresented: isPresented, systemIcon: systemIcon, title: title, message: message))
    }
}

struct IslandMediumAlertDebug_Previews: PreviewProvider {
    static var previews: some View {
        IslandMediumAlertExample()
    }
}
