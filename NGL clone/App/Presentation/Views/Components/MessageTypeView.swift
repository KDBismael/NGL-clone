//
//  MessageTypeView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/10/24.
//

import SwiftUI
import PhotosUI
//import Photos


struct MessageTypeView: View {
    
    @State private var isConfirming = false
    @State private var isPhotoPickerPresented = false
    @State private var photoPickerItem: PhotosPickerItem?
    @State private var message="Send me anonymous messages"
    
    var body: some View{
        ZStack {
            Rectangle()
                .frame(width: 350, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 50))
            
            VStack{
                Button {
                    print("Upload Photo")
                    isConfirming = true
                } label: {
                    Image("user1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                }
                .confirmationDialog("hey", isPresented: $isConfirming) {
                    Button("Upload Photo") {
                        isPhotoPickerPresented = true
                    }
                    
                    Button("Cancel", role: .cancel) {
                        isConfirming = false
                    }
                } message: {
                    Text("Edit Profile Picture")
                }
                .photosPicker(isPresented: $isPhotoPickerPresented, selection: $photoPickerItem, matching: .images)
                   
                TextField(text: $message) {
                    
                }
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            }
            
//            Button ("Heyy") {
//                print("Hey")
//            }
//            .background()
        }
        
        
    }
}

#Preview {
    MessageTypeView()
}
