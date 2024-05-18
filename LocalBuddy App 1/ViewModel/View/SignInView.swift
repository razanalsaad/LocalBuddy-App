//
//  SignInView.swift
//  LocalBuddy App 1
//
//  Created by razan on 12/05/2024.
//

import SwiftUI
import CloudKit
import AuthenticationServices

class SignInViewModel: NSObject, ObservableObject {
    @Published var isUserAuthenticated = false
    
    func signInWithAppleID() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email] // Request user's full name and email
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
}

extension SignInViewModel: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // Extract user's full name and email
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            // Now you have access to the user's full name and email
            print("User's full name: \(fullName?.givenName ?? "") \(fullName?.familyName ?? "")")
            print("User's email: \(email ?? "")")
            
            // Navigate to UserView after successful sign-in
            DispatchQueue.main.async {
                self.isUserAuthenticated = true
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Authorization failed: \(error.localizedDescription)")
    }
}

struct SignInView: View {
    @ObservedObject var viewModel = SignInViewModel()
    
    var body: some View {
      
            VStack {
                Text("Match your Activities \nwith others")
                  .font(.largeTitle)
                  .fontWeight(.black)
                  .foregroundColor(Color("mustard"))
                  .padding(.horizontal, 13.0)
                         
                
                Text("Connect with others who share the same \ninterest like you for unforgettable experiences")
                  .font(.headline)
                  .fontWeight(.medium)
                  .foregroundColor(Color.gray)
                  .padding(.vertical, 11.0)
                   
                
                NavigationLink(destination: UserProfileView()
                  .navigationBarHidden(true)
                  .navigationBarBackButtonHidden(true),
                               isActive: $viewModel.isUserAuthenticated) {
                    EmptyView()
                }
                
                Button(action: viewModel.signInWithAppleID) {
                    HStack {
                        Image(systemName: "applelogo")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Sign in with Apple")
                          .font(.system(size: 20))
                          .fontWeight(.semibold)
                          .foregroundColor(.white)
                            
                    }
                    .frame(width: 350,height: 60)
                    .background(Color.black)
                    .cornerRadius(10)
                }
                .padding(.top, 30.0)
            }
            .navigationBarHidden(true)
        }
    }




struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

//import SwiftUI
//import AuthenticationServices
//
//struct SignInView: View {
//    @State private var signedIn = false
//
//    var body: some View {
//
//            VStack {
//                Text("Match your Activities with others 😍")
//                    .font(.largeTitle)
//                    .fontWeight(.black)
//                    .foregroundColor(Color("mustard"))
//
//                Text("Connect with others who share the same interest like you for unforgettable experiences.")
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color.gray)
//                    .padding(.vertical, 35.0)
//
//                NavigationLink(destination: ExploreView(), isActive: $signedIn) {
//                    SignInWithAppleButton { success in
//                        self.signedIn = success
//                    }
//                }
//                .navigationBarHidden(true)
//            }
//        }
//    }
//
//
//struct SignInWithAppleButton: View {
//    var completion: ((Bool) -> Void)
//
//    var body: some View {
//        Button(action: signInWithApple) {
//            HStack {
//                Image(systemName: "applelogo")
//                    .font(.title)
//                    .foregroundColor(.white)
//                Text("Sign in with Apple")
//                    .font(.title3)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .padding()
//            }
//            .frame(width: 350, height: 60)
//            .background(Color.black)
//            .cornerRadius(10)
//        }
//    }
//
//    func signInWithApple() {
//        let provider = ASAuthorizationAppleIDProvider()
//        let request = provider.createRequest()
//        request.requestedScopes = [.fullName, .email]
//
//        let controller = ASAuthorizationController(authorizationRequests: [request])
//        let delegate = SignInWithAppleDelegate { success in
//            self.completion(success)
//        }
//        controller.delegate = delegate
//        controller.presentationContextProvider = UIApplication.shared.windows.first?.rootViewController as? ASAuthorizationControllerPresentationContextProviding
//
//        controller.performRequests()
//    }
//}
//
//class SignInWithAppleDelegate: NSObject, ASAuthorizationControllerDelegate {
//    var completion: ((Bool) -> Void)
//
//    init(completion: @escaping (Bool) -> Void) {
//        self.completion = completion
//    }
//
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        if let _ = authorization.credential as? ASAuthorizationAppleIDCredential {
//            DispatchQueue.main.async {
//                self.completion(true)
//            }
//        }
//    }
//
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//        print("Sign in with Apple error: \(error.localizedDescription)")
//        completion(false)
//    }
//}
//
//
//
//struct SignInView_Previews: PreviewProvider {
//   static var previews: some View {
//      SignInView()
//
//
//   }
//}
//
