//
//  FullScreenView.swift
//  Netflix
//
//  Created by Bryan Sánchez Peralta on 29/02/24.
//

import SwiftUI
import AVKit

struct FullScreenView: View {
    @Environment(\.dismiss) var dismiss
    let player = AVPlayer(url:  Bundle.main.url(forResource: "Movie", withExtension: "mp4")!)
    @State var isShowed = true
    
    var body: some View {
        VideoPlayer(player: player) {
            Button() {
                dismiss()
            } label: {
                Image(systemName: "chevron.backward")
            }
            .opacity(isShowed ? 1 : 0)
            .position(x: 60, y: 50)
        }
        .onAppear() {
            player.play()
            
            futureHideBack()
        }
        .onTapGesture {
            isShowed.toggle()
        }
        .onChange(of: isShowed) {
            if isShowed {
                futureHideBack()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func futureHideBack() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            isShowed = false
        }
    }
}

#Preview {
    FullScreenView()
}
