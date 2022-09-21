//
//  IslandMediumAlertExample.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import SwiftUI

struct IslandMediumAlertExample: View {
    
    @State private var alert = false
    
    public var body: some View {
        Button("Toggle alert") {
            withAnimation {
                alert.toggle()
            }
        }
        .buttonStyle(.borderedProminent)
        
        .islandMediumAlert(isPresented: $alert, systemIcon: "airpodspro", title: "Airpods connected")
    }
}

struct IslandMediumAlertExample_Previews: PreviewProvider {
    static var previews: some View {
        IslandMediumAlertExample()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
    }
}
