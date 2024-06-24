//
//  ContentButton.swift
//  Netflix
//
//  Created by Bryan Sánchez Peralta on 24/02/24.
//

import SwiftUI

struct ContentButton: View {
    let content: Content
    
    var body: some View {
        NavigationLink(destination: DetailView()) {
            ZStack {
                Image(content.rawValue)
                    .resizable()
                    .scaledToFill()
                
                if content.orginal {
                    Image("Logo")
                        .resizable()
                        .scaleEffect(0.1)
                        .position(x: 16, y: 32)
                }
            }
        }
        .frame(width: 150, height: 200)
        .buttonStyle(.plain)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    ContentButton(content: Content.formula1)
}
