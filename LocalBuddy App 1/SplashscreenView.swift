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
            
            Image("Clearlogo")
                .resizable()
                .scaledToFit()
                .scaleEffect(animateLogo ? 15 : 1)
                .opacity(animateLogo ? 0 : 1)
                .animation(Animation.easeIn(duration: 3))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            self.animateLogo = true
                        }
                    }
                }
        }
    }
}

struct SplashscreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashscreenView()
    }
}





//struct SplashscreenView: View {
//    @State private var showName = false
//    @State private var scaleAmount: CGFloat = 1.0
//
//    var body: some View {
//        VStack {
//            Spacer()
//
//            Image("AppIcon1")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .scaleEffect(scaleAmount)
//                .onAppear {
//                    // Shrink the logo to start the animation
//                    withAnimation(.easeOut(duration: 1).delay(1)) {
//                        scaleAmount = 0.5
//                    }
//                    // Enlarge the logo
//                    withAnimation(.easeInOut(duration: 1).delay(2)) {
//                        scaleAmount = 60
//                    }
//                }
//
//            if showName {
////               Color.white
////                                  .edgesIgnoringSafeArea(.all)
////
////                              Text("Connect with Local Buddy, Discover world Cultures")
////                                .font(.title)
////                                  .fontWeight(.black)
////                                  .foregroundColor(Color.white)
////                                  .multilineTextAlignment(.center)
////              //
//
//            }
//
//            Spacer()
//        }
//        .onAppear {
//            withAnimation(.easeInOut(duration: 1).delay(3)) {
//                showName.toggle()
//            }
//        }
//    }
//}
//

//import SwiftUI
//struct SplashscreenView: View {
//    @State private var animateLogo = false
//
//    var body: some View {
//        ZStack {
//            Color.yellow
//                .edgesIgnoringSafeArea(.all)
//
//            Image("AppIcon1")
//                .resizable()
//                .scaledToFit()
//                .scaleEffect(animateLogo ? 25 : 1)
//                .opacity(animateLogo ? 0 : 1)
//                .animation(Animation.easeIn(duration: 3))
//                .onAppear {
//                   DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                        withAnimation {
//                            self.animateLogo = true
//                        }
//                    }
//                }
//        }
//    }
//}
