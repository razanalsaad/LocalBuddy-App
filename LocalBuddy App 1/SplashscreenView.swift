//
//  SplashscreenView.swift
//  LocalBuddy App 1
//
//  Created by razan on 30/04/2024.
//


import SwiftUI
struct SplashscreenView: View {
    @State private var animateLogo = false
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            Image("AppIcon1")
                .resizable()
                .scaledToFit()
                .scaleEffect(animateLogo ? 25 : 1)
                .opacity(animateLogo ? 0 : 1)
                .animation(Animation.easeIn(duration: 3))
                .onAppear {
                   DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            self.animateLogo = true
                        }
                    }
                }
        }
    }
}
