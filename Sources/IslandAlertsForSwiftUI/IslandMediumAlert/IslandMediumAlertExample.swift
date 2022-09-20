//
//  IslandMediumAlertExample.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import SwiftUI

public struct IslandMediumAlertExample: View {
    
    @State private var alert = false
    
    public var body: some View {
        Button("Toggle alert") {
            withAnimation {
                alert.toggle()
            }
        }
        .islandMediumAlert(isPresented: $alert, systemIcon: "airpodspro", title: "Airpods connected", message: "Alessio's airpods connected")
    }
}

struct IslandMediumAlertExample_Previews: PreviewProvider {
    static var previews: some View {
        IslandMediumAlertExample()
    }
}
