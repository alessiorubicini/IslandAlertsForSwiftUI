//
//  IslandLargeAlertExample.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import SwiftUI

public struct IslandLargeAlertExample: View {
    
    @State private var alert = false
    
    public var body: some View {
        Button("Toggle alert") {
            withAnimation {
                alert.toggle()
            }
        }
        .buttonStyle(.borderedProminent)
        
        .islandLargeAlert(isPresented: $alert, title: "Hi! Alert!", message: "This is a test for presenting an alert from the Dynamic Island.", action: {
            alert.toggle()
        })
    }
}

struct IslandLargeAlertExample_Previews: PreviewProvider {
    static var previews: some View {
        IslandLargeAlertExample()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
    }
}
