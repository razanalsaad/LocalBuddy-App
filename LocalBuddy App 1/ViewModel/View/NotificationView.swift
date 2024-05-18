//
//  NotificationView.swift
//  LocalBuddy
//
//  Created by razan on 15/05/2024.
//

import SwiftUI

struct Profile: Identifiable {
    let id = UUID()
    let profilePicture: Image
    let username: String
    let timestamp: String
}

struct NotificationView: View {
    @State private var profiles: [Profile] = [
        Profile(profilePicture: Image(systemName: "")
                , username: "Alexa Joe", timestamp: "20m ago"),
        Profile(profilePicture: Image(systemName: ""), username: "Emily Smith ", timestamp: "1h ago")
    ]

    var body: some View {
      
            ScrollView {
                
                
                
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(profiles) { profile in
                    
                        HStack(alignment: .top, spacing: 15) {
                            profile.profilePicture
                            Image("circleimage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 100)
                                .font(.title)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.mustard)
                                .padding()
                            
                            VStack(alignment: .leading, spacing:4) {
                                Text(profile.username)
                                    .fontWeight(.bold)
                                VStack {
                                    
                                    Text("wants to join your activity")
                                        .fontWeight(.regular)
                                }
                                    .font(.headline)
                                Text(profile.timestamp)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)

                                Spacer()

                                HStack(spacing: 25) {
                                    Button(action: {
                                        // Action for the "Accept" button
                                        
                                    }) {
                                        
                                        
                                        Text("Accept")
                                            .foregroundColor(.white)
                                            .frame(height: 5)
                                            .padding()
                                            .background(Color.black)
                                            .cornerRadius(10)
                                        
                                    }

                                    Button(action: {
                                        // Action for the "Reject" button
                                        
                                    }) {
                                        Text("Reject")
                                            .foregroundColor(.black)
                                            .frame(height: 5)
                                            .padding()
                                            .background(Color.gray2)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        Divider()
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationBarTitle("Notification")
        }
    }


#Preview {
    NotificationView()
}
