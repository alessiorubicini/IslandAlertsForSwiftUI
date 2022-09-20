//
//  IslandSquareAlertExample.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import SwiftUI

public struct IslandSquareAlertExample: View {
    
    @State private var alert = false
    
    public var body: some View {
        Button("Toggle alert") {
            withAnimation {
                alert.toggle()
            }
        }
        .islandSquareAlert(isPresented: $alert, systemIcon: "faceid", text: "Login")
    }
}

struct IslandSquareAlertExample_Previews: PreviewProvider {
    static var previews: some View {
        IslandSquareAlertExample()
    }
}
