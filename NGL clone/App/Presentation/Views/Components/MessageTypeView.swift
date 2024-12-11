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
    
    var body: some View{
        
        VStack(spacing:15){
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
            
            Text("\(message)")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
            
            HStack{
                Spacer()
                Button {
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .font(.title)
                        .fontWeight(.bold)
                }

                Button {
                    
                } label: {
                    Image(systemName: "circle.square")
                        .font(.title)
                        .fontWeight(.bold)
                    
                }.frame(width: 70,height: 70)
                .background(.gray.opacity(0.3))
                .clipShape(Circle())

            }
            .foregroundStyle(.white)
            .padding(.horizontal)
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 30.0)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        }
}

#Preview {
    MessageTypeView()
}
