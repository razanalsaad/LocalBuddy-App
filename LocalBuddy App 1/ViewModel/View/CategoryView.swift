//
//  CategoryView.swift
//  LocalBuddy App 1
//
//  Created by razan on 12/05/2024.
//

//
//  CategoryView.swift
//  LocalBuddy App 1
//
//  Created by razan on 12/05/2024.
//
import SwiftUI
import CloudKit

struct CategoryView: View {
    @State private var selectedCategories: [String] = []
    @State private var isSaved: Bool = false
    @State private var isActive: Bool = false // Track active state for custom NavigationLink

    var body: some View {
        NavigationView {
            VStack {
                Text("Choose your Favorite Category")
                  .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("mustard"))
                    .multilineTextAlignment(.leading)
                    .padding([.leading, .bottom, .trailing])
                
                
                Text("To match your activities with \nLocals 🤩!")
                  .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .bottom, .trailing], 19.0)
                
                HStack {
                    CategoryButton(title: "ART", selectedCategories: $selectedCategories)
                    CategoryButton(title: "Sport", selectedCategories: $selectedCategories)
                }
                
                HStack {
                    CategoryButton(title: "Food", selectedCategories: $selectedCategories)
                    CategoryButton(title: "Camping", selectedCategories: $selectedCategories)
                    CategoryButton(title: "Ceremony", selectedCategories: $selectedCategories)
                }
                
                Button(action: {
                    if selectedCategories.count == 2 {
                        saveCategoriesToCloudKit(categories: selectedCategories)
                        isActive = true // Activate custom NavigationLink
                    }
                }) {
                    Text("Get Started")
                        .frame(width: 300, height: 30)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(12)
                }
                .padding([.top, .leading, .trailing], 37.0)
                .background(
                    NavigationLink(destination: TabsView()
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true),
                        isActive: $isActive) {
                        EmptyView()
                    }
                )
            }
            .navigationBarHidden(true) // Hide navigation bar in CategoryView
        }
    }

    func saveCategoriesToCloudKit(categories: [String]) {
        let database = CKContainer.default().publicCloudDatabase
        for category in categories {
            let record = CKRecord(recordType: "Category")
            record["text"] = category as CKRecordValue
            database.save(record) { (record, error) in
                if let error = error {
                    print("Error saving category to CloudKit: \(error.localizedDescription)")
                } else {
                    print("Category saved to CloudKit")
                }
            }
        }
    }
}

struct CategoryButton: View {
    let title: String
    @Binding var selectedCategories: [String]
    
    var body: some View {
        Button(action: {
            if selectedCategories.contains(title) {
                selectedCategories.removeAll { $0 == title }
            } else if selectedCategories.count < 2 {
                selectedCategories.append(title)
            }
        }) {
            Text(title)
                .font(.headline)
                .fontWeight(.medium)
                .padding()
                .foregroundColor(selectedCategories.contains(title) ? .white : .black)
                .background(selectedCategories.contains(title) ? Color.mustard : Color.gray4)
                .cornerRadius(25)
        }
        .padding([.top, .leading, .trailing], 10)
       
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
