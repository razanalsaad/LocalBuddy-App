//
//  UserView.swift
//  LocalBuddy App 1
//
//  Created by razan on 07/05/2024.
//
import SwiftUI
import CloudKit

struct UserProfileView: View {
    @StateObject var viewModel = UserViewModel()
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var activities: [String] = ["Food", "Sport", "Camping", "Ceremonie"]
    @State private var selectedActivities: [String] = []
    
    var userInitial: String {
        let firstNameInitial = viewModel.firstName.isEmpty ? "" : String(viewModel.firstName.first!)
        let lastNameInitial = viewModel.lastName.isEmpty ? "" : String(viewModel.lastName.first!)
        return firstNameInitial + lastNameInitial
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: headerView) {
                    EmptyView()
                }
                
                Section(header: Text("Your Activities")) {
                    HStack {
                        ForEach(activities, id: \.self) { activity in
                            ActivityButton(activity: activity, selectedActivities: $selectedActivities)
                        }
                    }
                }
                
                Section(header: Text("First Name")) {
                    TextField("First Name", text: $viewModel.firstName)
                }
                
                Section(header: Text("Last Name")) {
                    TextField("Last Name", text: $viewModel.lastName)
                }
                
                Section(header: Text("Birth Date")) {
                    DatePicker("Birth Date", selection: $viewModel.birthdate, displayedComponents: .date)
                }
                
                Section(header: Text("Email")) {
                    TextField("Email", text: $viewModel.email)
                }
                
                Section(header: Text("Password")) {
                    TextField("Password", text: $viewModel.password)
                }
                
                Section(header: Text("Gender")) {
                    Picker(selection: $viewModel.gender, label: Text("Gender")) {
                        ForEach([UserViewModel.Gender.male, UserViewModel.Gender.female], id: \.self) { gender in
                            Text(gender == .male ? "Male" : "Female").tag(gender)
                        }
                    }
                    .pickerStyle(DefaultPickerStyle())
                }
                
                Section(header: Text("Language Spoken")) {
                    List {
                        ForEach(["Arabic", "English", "French", "Italian", "Spanish"], id: \.self) { language in
                            MultipleSelectionRow(title: language, isSelected: viewModel.languageSpoken.contains(language)) {
                                if viewModel.languageSpoken.contains(language) {
                                    viewModel.languageSpoken.removeAll { $0 == language }
                                } else {
                                    viewModel.languageSpoken.append(language)
                                }
                            }
                        }
                    }
                }
                
                Section(header: Text("About Me")) {
                    TextField("About Me", text: $viewModel.aboutMe)
                }
                
            }
            .accentColor(.black)
            .navigationBarTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Sign out action
                    }) {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }

    private var headerView: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            } else {
                Circle()
                    .foregroundColor(.mustard)
                    .frame(width: 120, height: 120)
                    .overlay(
                        Text(userInitial)
                            .font(.title)
                            .foregroundColor(.white)
                    )
            }

            Button(action: {
                isImagePickerPresented.toggle()
            }) {
                Text("EDIT")
                    .font(.footnote)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.gray)
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: $selectedImage)
            }
        }
        .padding(.leading, 100)
    }
}

struct ActivityButton: View {
    let activity: String
    @Binding var selectedActivities: [String]

    var body: some View {
        Button(action: {
            if selectedActivities.contains(activity) {
                selectedActivities.removeAll { $0 == activity }
            } else {
                selectedActivities.append(activity)
            }
        }) {
            Text(activity)
                .font(.callout)
                .fontWeight(.semibold)
                .padding(7.0)
                .background(selectedActivities.contains(activity) ? Color.black : Color.yellow)
                .foregroundColor(selectedActivities.contains(activity) ? .white : .black)
                .cornerRadius(6)
        }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.mustard)
                }
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
