//
//
//  myActivity.swift
//  LocalBuddy
//
//  Created by Ghadah Albassam on 14/05/2024.
//

import SwiftUI

struct my_Activity: View {
    
    @EnvironmentObject var viewModel: ActivityViewModel
    
    var body: some View {
    
    CreateActivityView()
        Group {
            
            Text("My Activities")
                .font(.system(size: 25))
                .fontWeight(.bold)
            .position(CGPoint(x: 200, y: 27.0))
        
           
        
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 340, height: 250)
                .cornerRadius(10)
                .shadow(radius: 2)
            
            
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
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 3))
                           
                
                Text("Camping (Kashta)")
                    .font(.system(size: 15))
                    .bold()
                
            }.position(x: 180, y: 160)
                
            
              
            
           HStack {
              HStack{
                 Image(systemName: "calendar")
                    .foregroundColor(Color("mustard"))
                    .font(.system(size: 14))
                 
                 Text("May 8th, 2024")
                    .font(.system(size: 14))
                    .bold()
                 
              }
              
                 .position(CGPoint(x: 82, y: 197))
              
              Image(systemName: "trash")
                 .foregroundColor(Color.red)
                 .font(.system(size: 14))
                 .offset(x: /*@START_MENU_TOKEN@*/-23.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/68.0/*@END_MENU_TOKEN@*/)
              
           }
         
         
           
            Text("Number Of people joined : 0")
                .position(CGPoint(x: 120, y: 230))
                .font(.system(size: 14))
                .bold()
            
        } .padding(.horizontal, 26.0)
         .position(CGPoint(x: 200, y: -50))
        }.padding(.top)
    }
}

#Preview {
    my_Activity()
        .environmentObject(ActivityViewModel())
}

