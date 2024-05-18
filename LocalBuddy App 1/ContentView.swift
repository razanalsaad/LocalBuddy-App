//
//  ContentView.swift
//  LocalBuddy App 1
//
//  Created by razan on 30/04/2024.
//
import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    @State private var showMainView = false
    @State private var showNextView = false
    
    var body: some View {
        ZStack {
            if showSplash {
                SplashscreenView()
                    .transition(.opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            withAnimation {
                                self.showSplash = false
                                self.showMainView = true
                            }
                        }
                    }
            } else if showNextView {
                CategoryView()
                    .transition(.opacity)
            } else if showMainView {
                MainView(showNextView: $showNextView)
            }
        }
    }
}

struct MainView: View {
    @Binding var showNextView: Bool
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Connect with Local Buddy Discover world Cultures")
                  .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.showNextView = true
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
