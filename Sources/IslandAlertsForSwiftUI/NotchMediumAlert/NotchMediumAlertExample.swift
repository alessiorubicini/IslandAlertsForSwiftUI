//
//  NotchMediumAlertExample.swift
//  
//
//  Created by Alessio Rubicini on 21/09/22.
//

import SwiftUI

public struct NotchMediumAlertExample: View {
    
    @State private var alert = false
    
    public var body: some View {
        Button("Toggle alert") {
            withAnimation {
                alert.toggle()
            }
        }
        .notchMediumAlert(isPresented: $alert, systemIcon: "airpodspro", title: "Airpods connected")
    }
}

struct NotchMediumAlertExample_Previews: PreviewProvider {
    static var previews: some View {
        NotchMediumAlertExample()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}
