//
//  NotificationView.swift
//  LocalBuddy 
//
//  Created by Renad fahad Alfurayhi on 07/11/1445 AH.
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
        Profile(profilePicture: Image(systemName: "person.circle.fill")
                , username: "John Doe", timestamp: "2 minutes ago"),
        Profile(profilePicture: Image(systemName: "person.circle.fill"), username: "Jane Smith", timestamp: "5 minutes ago")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(profiles) { profile in
                        HStack(alignment: .top, spacing: 40) {
                            profile.profilePicture
                                .font(.title)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.mustard)
                                .padding()
                            VStack(alignment: .leading, spacing:4) {
                                Text(profile.username)
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
                                            .padding()
                                            .background(Color.black)
                                            .cornerRadius(10)
                                    }

                                    Button(action: {
                                        // Action for the "Reject" button
                                        
                                    }) {
                                        Text("Reject")
                                            .foregroundColor(.black)
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
}

#Preview {
    NotificationView()
}
