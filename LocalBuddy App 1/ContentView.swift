//
//  ContentView.swift
//  LocalBuddy App 1
//
//  Created by razan on 30/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            if showSplash {
                SplashscreenView()
                  .transition(.opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            withAnimation {
                                self.showSplash = false
                            }
                        }
                    }
            } else {
                Color.yellow
                    .edgesIgnoringSafeArea(.all)
                
                Text("Find your local buddy from around the world")
                  .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

