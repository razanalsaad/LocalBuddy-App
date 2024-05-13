//
//  CategoryView.swift
//  LocalBuddy App 1
//
//  Created by razan on 12/05/2024.
//

import SwiftUI
import CloudKit

struct CategoryView: View {
    @State private var selectedCategory: String? = nil
    @State private var isSaved: Bool = false
    
    var body: some View {
        VStack {
            Text("Choose your Intrest Category")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
                .padding(.trailing, 76.0)
            
            Text("To match your activities with Locals 🤩!")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(Color.gray)
                .padding(.vertical, 17.0)
            
            HStack {
                CategoryButton(title: "ART", selectedCategory: $selectedCategory)
                CategoryButton(title: "Sport", selectedCategory: $selectedCategory)
            }
            
            HStack {
                CategoryButton(title: "Food", selectedCategory: $selectedCategory)
                CategoryButton(title: "Camping", selectedCategory: $selectedCategory)
                CategoryButton(title: "Ceremony", selectedCategory: $selectedCategory)
            }
    
           
            Button(action: {
                if let category = selectedCategory {
                    saveCategoryToCloudKit(category: category)
                    isSaved = true
                }
            }) {
                Text(" Get Started🔥")
                  .frame(maxWidth: .infinity)
                  .font(.title3)
                  .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(12)
                   
            }
            .padding([.top, .leading, .trailing], 30.0)
            
            if isSaved {
                Text("")
                  
            }
        }
    }
    
    func saveCategoryToCloudKit(category: String) {
        let record = CKRecord(recordType: "Category")
        record["text"] = category as CKRecordValue
        
        let database = CKContainer.default().publicCloudDatabase
        database.save(record) { (record, error) in
            if let error = error {
                print("Error saving category to CloudKit: \(error.localizedDescription)")
            } else {
                print("Category saved to CloudKit")
            }
        }
    }
}

struct CategoryButton: View {
    let title: String
    @Binding var selectedCategory: String?
    
    var body: some View {
        Button(action: {
            selectedCategory = title
        }) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(selectedCategory == title ? .white : .black)
                .background(selectedCategory == title ? Color.gray : Color.yellow)
                .cornerRadius(10)
        }
        .padding([.top, .leading, .trailing], 10)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
