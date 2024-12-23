//
//  PlayView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/11/24.
//

import SwiftUI
import PhotosUI

struct PlayView: View {
    
    private let  gradientColorRed:LinearGradient = LinearGradient(colors:[Color(hex: "#ec197d"),Color(hex: "#fc8118")], startPoint:.leading, endPoint: .trailing)
    
    private let gradientColorBlue = LinearGradient(colors:[Color(hex: "#0fc0f0"),Color(hex: "#800080")], startPoint:.leading, endPoint: .trailing)
    
    @State var scrollPosition: Int?
    @Binding  var showShareDialog:Bool
    @Binding  var showCopiedDialog:Bool
    @State private var isConfirming = false
    @State private var isPhotoPickerPresented = false
    @State private var photoPickerItem: PhotosPickerItem?
    @State private var buttonsGradientColor:LinearGradient = LinearGradient(colors:[Color(hex: "#ec197d"),Color(hex: "#fc8118")], startPoint:.leading, endPoint: .trailing)
    
    var body: some View {
        VStack(spacing:30){
            GeometryReader { proxy in
                let size = proxy.size
                
                ScrollView(.horizontal) {
                    HStack (spacing:0){
                        MessageTypeView()
                            .frame(width: size.width * 0.87)
                            .padding(.horizontal,10)
                            .scrollTransition(.interactive) { content, phase in
                                content
                                    .offset(x: 16)
                            }
                            .onScrollVisibilityChange { isVisible in
                                withAnimation(.smooth) {
                                    if isVisible {
                                        buttonsGradientColor = gradientColorRed
                                    }
                                }
                                
                            }
                        
                        VStack{
                            VStack{
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
                                
                                Text("Confessions")
                                    .font(.title)
                                    .frame(maxWidth: 300)
                                    .fontWeight(.black)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                            }
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(gradientColorBlue)
                            
                            Text("Send me anonymous confessions")
                                .padding(.vertical,5)
                                .padding(.horizontal)
                        }
                        .frame(width: size.width * 0.87)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .shadow(radius: 4.0)
                        .padding(.horizontal, 10)
                        .scrollTransition(.interactive) { content, phase in
                            content
                                .offset(x: 16)
                        }
                        .onScrollVisibilityChange { isVisible in
                            withAnimation(.smooth) {
                                if isVisible {
                                    buttonsGradientColor = gradientColorBlue
                                }
                            }
                        }
                        
                        
                        VStack{
                            VStack{
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
                                
                                Text("3 words")
                                    .font(.title)
                                    .frame(maxWidth: 300)
                                    .fontWeight(.black)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                            }
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(gradientColorRed)
                            
                            Text("Describe me in 3 words, anonymously")
                                .padding(.vertical,5)
                                .padding(.horizontal)
                        }
                        .frame(width: size.width * 0.87)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .shadow(radius: 4.0)
                        .padding(.horizontal, 10)
                        .scrollTransition(.interactive) { content, phase in
                            content
                                .offset(x: 16)
                        }
                        .onScrollVisibilityChange { isVisible in
                            withAnimation(.smooth) {
                                if isVisible {
                                    buttonsGradientColor = gradientColorRed
                                }
                            }
                        }
                        
                    }
                    .scrollTargetLayout()
                }
                .scrollClipDisabled()
                .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                .safeAreaPadding(.trailing, (size.width - 300) / 2)
                .scrollIndicators(.hidden)
            }
            
            
            VStack(spacing:15){
                Text("Step 1: Copy your link")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Text("NGL.LINK/KDB86640")
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                Button {
                    showCopiedDialog = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        showCopiedDialog = false
                        showShareDialog = true
                    }
                } label: {
                    HStack{
                        Image(systemName: "link")
                        Text("Copy Link")
                        
                    }
                    .font(.system(size: 18))
                    .foregroundStyle(buttonsGradientColor)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                }.overlay {
                    Capsule()
                        .stroke(lineWidth: 3)
                        .fill(buttonsGradientColor)
                }
                
                HStack{
                    Spacer()
                }
                
            }
            .padding(.vertical, 30)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 45))
            
            VStack(spacing:15){
                Text("Step 2: Share link on your story")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                Button {
                    showShareDialog = true
                } label: {
                    HStack{
                        Spacer()
                        Text("Share!")
                        Spacer()
                    }
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                }
                .background(buttonsGradientColor)
                .clipShape(RoundedRectangle(cornerRadius: 45))
                
                
                HStack{
                    Spacer()
                }
            }
            .padding(30)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 45))
        }
        .padding()
    }
    
}

#Preview {
    PlayView(showShareDialog: .constant(false), showCopiedDialog: .constant(false))
}

