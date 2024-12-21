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
    @State private var message="Send me anonymous messages!"
    @State private var messageIndex = 0
    @State private var messages:[String] = [
        "send me anonymous messages!",
        "ask me anything, anonymously",
        "tell me what you REALLY think about me!",
    ]
    
    var body: some View{
        
        VStack(spacing:15){
            Button {
                print("Upload Photo")
                isConfirming = true
            } label: {
                Image("user1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
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
            
            Text("\(messages[messageIndex])")
                .font(.title2)
                .frame(maxWidth: 300)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
            
            HStack{
                Spacer()
                if(messageIndex != 0){
                    Button {
                        messageIndex = 0
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .fontWeight(.bold)
                    }
                }
                
                Button {
                    guard messageIndex < 2 else {
                        return messageIndex = 0
                    }
                    messageIndex += 1
                } label: {
                    Image(systemName: "circle.square")
                        .fontWeight(.bold)
                    
                }.frame(width: 50,height: 50)
                .background(.gray.opacity(0.3))
                .clipShape(Circle())

            }
            .font(.title2)
            .foregroundStyle(.white)
            .padding(.horizontal)
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15.0)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        }
}

#Preview {
    MessageTypeView()
}
