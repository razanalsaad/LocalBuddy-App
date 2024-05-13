//
//  SignInView.swift
//  LocalBuddy App 1
//
//  Created by razan on 12/05/2024.
//
import SwiftUI
import CloudKit
import AuthenticationServices

struct SignInView: View {
   
    @EnvironmentObject var userViewModel: UserViewModel
   
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Match your Activities with others😍")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color("mustard"))
                    .multilineTextAlignment(.leading)
                
                Text("Connect with others who share the same interest like you for unforgettable experiences.")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 35.0)
                
                NavigationLink(destination: UserProfileView(), isActive: $userViewModel.isUserAuthenticated) {
                    EmptyView()
                }
             
                Button(action: {
                   userViewModel.signInWithAppleID()
                }) {
                    HStack {
                        Image(systemName: "applelogo")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Sign in with Apple")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
                }
                .padding(9)
            }
            .navigationBarHidden(true)
            .onAppear {
                userViewModel.fetchLBUsers()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignInView()
                .environmentObject(UserViewModel())
        }
    }
}
