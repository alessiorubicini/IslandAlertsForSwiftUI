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
                                .font(.largeTitle)
                                .symbolRenderingMode(.multicolor)
                                .padding(.horizontal, 20)
                                .padding(.top, 40)
                            
                            Text(text).font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.top, 20)
                            
                            //Spacer()
                        }
                        .onTapGesture {
                            withAnimation {
                                isPresented.toggle()
                            }
                        }
                        
                    }
                    
                }
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
    public func islandSquareAlert(isPresented: Binding<Bool>, systemIcon: String, text: String) -> some View {
        ModifiedContent(content: self, modifier: IslandSquareAlert(isPresented: isPresented, systemIcon: systemIcon, text: text))
    }
}

struct IslandSquareAlertDebug_Previews: PreviewProvider {
    static var previews: some View {
        IslandSquareAlertExample()
    }
}
