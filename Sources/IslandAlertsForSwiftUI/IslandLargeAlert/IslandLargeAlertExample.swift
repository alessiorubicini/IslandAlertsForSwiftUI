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
        .islandLargeAlert(isPresented: $alert, title: "Hello, Island", message: "This is a test for the brand new Swift package from Alessio Rubicini.")
    }
}

struct IslandLargeAlertExample_Previews: PreviewProvider {
    static var previews: some View {
        IslandLargeAlertExample()
    }
}
