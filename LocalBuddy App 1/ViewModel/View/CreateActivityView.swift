//
//  CreateActivityView.swift
//  LocalBuddy App 1
//
//  Created by razan on 12/05/2024.
//

import SwiftUI

struct CreateActivityView: View {
    @EnvironmentObject var viewModel: ActivityViewModel
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.mustard)
                    .frame(width: 342, height: 200)
                    .cornerRadius(10)
                    .position(CGPoint(x: 200, y: 130))
                
                Text("Share your interests, plan activities, and connect with others who share your \n passion for unforgettable experiences")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.body)
                    .position(CGPoint(x: 200, y: 100))
                
                NavigationLink(destination: activityForm()) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: 300, height: 60)
                            .cornerRadius(10)
                        
                       Text("Create Activity ")
                          .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                    .position(CGPoint(x: 200, y: 182))
                }
            }
        }
        .navigationBarItems(trailing:
                        NavigationLink(destination: NotificationView()) { // Navigate to NotificationView
                            Image(systemName: "bell.badge")
                .foregroundColor(.black)
                        }
                    )
                }
            }
        


#Preview {
    CreateActivityView()
        .environmentObject(ActivityViewModel())
}
