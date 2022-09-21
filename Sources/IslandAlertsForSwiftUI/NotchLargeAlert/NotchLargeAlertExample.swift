//
//  NotchLargeAlertExample.swift
//  
//
//  Created by Alessio Rubicini on 20/09/22.
//

import SwiftUI

public struct NotchLargeAlertExample: View {
    
    @State private var alert = false
    
    public var body: some View {
        Button("Toggle alert") {
            withAnimation {
                alert.toggle()
            }
        }
        .notchLargeAlert(isPresented: $alert, title: "Hello, Island", message: "This is a test for the new Notch alert.", action: {
            alert.toggle()
        })
    }
}

struct NotchLargeAlertExample_Previews: PreviewProvider {
    static var previews: some View {
        NotchLargeAlertExample()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}
