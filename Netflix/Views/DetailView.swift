//
//  DetailViewView.swift
//  Netflix
//
//  Created by Bryan Sánchez Peralta on 28/02/24.
//

import SwiftUI
import AVKit

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    
    let player = AVPlayer(url:  Bundle.main.url(forResource: "Movie", withExtension: "mp4")!)
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: Trailer
            ZStack(alignment: .topLeading) {
                AVPlayerControllerRepresented(player: player)
                    .scaledToFill()
                    .frame(maxHeight: 250)
                    .clipped()
                    .onAppear {
                        // Play the video automatically
                        player.play()
                        
                        // Restart the video when it ends
                        NotificationCenter.default.addObserver(
                            forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main
                        ) { _ in
                            player.seek(to: .zero)
                            player.play()
                        }
                    }
                
                Button() {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                }.padding()
            }
            ScrollView() {
                // MARK: Type
                VStack(alignment: .leading) {
                    HStack {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                        Text("FILM")
                    }
                    
                    // MARK: Title
                    Text("Lift")
                        .font(.title)
                    
                    // MARK: Info
                    HStack {
                        Text("94% compatibility")
                            .foregroundStyle(.green)
                        Text("2024")
                        RoundedRectangle(cornerRadius: 3)
                            .frame(width: 30, height: 20)
                            .foregroundStyle(.background)
                            .overlay(
                                Text("13+")
                                    .font(.system(size: 10))
                            )
                        Text("1h 46m")
                        Text("HD")
                            .padding(.horizontal, 4)
                            .border(.background, width: 2)
                            .clipShape(.rect(cornerRadius: 3))
                        Image(systemName: "text.bubble.rtl")
                    }
                    
                    // MARK: Play button
                    NavigationLink(destination: FullScreenView()) {
                        HStack(spacing: 16) {
                            Image(systemName: "play.fill")
                                .scaleEffect(1.5)
                                .padding(.vertical, 14)
                            Text("Play")
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.black)
                    }
                    .buttonStyle(.borderless)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 8))
                    
                    // MARK: Summary
                    Text("A professional thief and his expert crew attempt the ultimate heist: stealing $500 million in gold from a vault on a plane 40,000 feet in the air.")
                    VStack(alignment: .leading) {
                        // MARK: Cast
                        HStack(spacing: 1) {
                            Text("Cast: Kevin Hart, Gugu Mbatha-Raw, Vincent D'Onofrio")
                            Button("... altro") { }
                                .buttonStyle(.plain)
                        }
                        
                        // MARK: Direction
                        Text("Regia: F. Gary Gray")
                    }.foregroundStyle(.background)
                    
                    
                    // MARK: Actions
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "plus")
                                .font(.system(size: 30))
                            Text("My List").bold()
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "hand.thumbsup")
                                .font(.system(size: 30))
                            Text("Evaluate").bold()
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "paperplane")
                                .font(.system(size: 30))
                            Text("recommend").bold()
                        }
                        Spacer()
                    }
                    
                    // MARK: List
                    Rectangle()
                        .foregroundStyle(.red)
                        .frame(width: 191)
                    HStack {
                        Text("Other similar content")
                        Text("Trailer")
                            .foregroundStyle(.background)
                    }.font(.title3)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<6) { _ in
                                Image(Content.suits.rawValue)
                                    .resizable()
                                    .frame(width: 170, height: 250)
                                    .clipShape(.rect(cornerRadius: 8))
                                    .padding(.trailing, 16)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                .navigationBarBackButtonHidden()
            }
        }
    }
}

struct AVPlayerControllerRepresented : UIViewControllerRepresentable {
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) { }
}

#Preview {
    DetailView()
}
