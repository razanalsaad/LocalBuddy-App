

import SwiftUI

struct TabsView: View {
   
   @StateObject var userViewModel = UserViewModel()

    var body: some View { TabView {
       NavigationView {
           SignInView()
             .environmentObject(userViewModel)
               .navigationBarHidden(true)
          
       }
       .tabItem {
           Label("Profile", systemImage: "person.crop.circle")
       }

       NavigationView {
           ExploreView()
               .navigationBarHidden(true)
       }
       .tabItem {
           Label("Explore", systemImage: "sparkle.magnifyingglass")
       }

       NavigationView {
           CreateActivityView()
               .navigationBarHidden(true)
       }
       .tabItem {
           Label("Activity", systemImage: "figure.outdoor.cycle")
       }

       NavigationView {
           ChatsView()
               .navigationBarHidden(true)
       }
       .tabItem {
           Label("Chats", systemImage: "bubble.left.and.text.bubble.right")
       }
   }
   .accentColor(Color.mustard)
}
}

#Preview {
    TabsView()
}
