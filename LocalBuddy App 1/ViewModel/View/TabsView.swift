
import SwiftUI

struct TabsView: View {
    @StateObject var userViewModel = UserViewModel()
    @StateObject var viewModel = ActivityViewModel()

    var body: some View {
        TabView {
            NavigationView {
                ExploreView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true) // Hide back button
                    .environmentObject(userViewModel)
                    .accentColor(.black) // Override accent color
            }
            .tabItem {
               Label("Explore", systemImage: "sparkle.magnifyingglass")
            }

            NavigationView {
                CreateActivityView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true) // Hide back button
                    .environmentObject(viewModel)
                    .accentColor(.black) // Override accent color
            }
            .tabItem {
                Label("Activity", systemImage: "figure.outdoor.cycle")
            }

            NavigationView {
                ChatlistView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true) // Hide back button
                    .accentColor(.black) // Override accent color
            }
            .tabItem {
                Label("Chats", systemImage: "bubble.left.and.text.bubble.right")
            }

            NavigationView {
                SignInView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true) // Hide back button
                    .environmentObject(userViewModel)
                    .accentColor(.black)
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
        }
        .accentColor(.mustard) // Set the tab item label color to mustard
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
            .environmentObject(ActivityViewModel())
    }
}


