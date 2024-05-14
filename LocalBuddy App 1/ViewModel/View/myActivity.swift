//
//  myActivity.swift
//  LocalBuddy 
//
//  Created by Ghadah Albassam on 14/05/2024.
//

import SwiftUI

struct myActivity: View {
    
    @EnvironmentObject var viewModel: ActivityViewModel
    
    var body: some View {
        CreateActivityView()
            
        Group {
            Text("My Activities")
                .bold()
                .font(.system(size: 25))
                .padding(.horizontal, 24)
            .position(CGPoint(x: 200, y: 10.0))
        
           
        
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 340, height: 250)
                .cornerRadius(10)
                .shadow(radius: 10)
            
            
            Image("camping")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 340, height: 170)
                .clipped()
                .cornerRadius(10)
                .alignmentGuide(.top) { _ in 0 }
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color("mustard"))
                    .cornerRadius(10)
                    .frame(width: 150, height: 40)
                
                
                Text("Camping (Kashta)")
                    .font(.system(size: 15))
                    .bold()
                
            }.position(x: 180, y: 160)
                
            
              
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(Color("mustard"))
                    .font(.system(size: 14))
                
                Text("May 8th, 2024")
                    .font(.system(size: 14))
                    .bold()
                
                Image(systemName: "trash")
                    .foregroundColor(Color.red)
                    .font(.system(size: 14))
              
                   
            } .position(CGPoint(x: 100, y: 200))
            
            Text("Number Of people joined : 0")
                .position(CGPoint(x: 120, y: 230))
                .font(.system(size: 14))
                .bold()
            
        } .padding(.horizontal, 24) .position(CGPoint(x: 200, y: -80))
        }
    }
}

#Preview {
    myActivity()
        .environmentObject(ActivityViewModel())
}
