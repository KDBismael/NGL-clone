//
//  shareDialogView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/17/24.
//

import SwiftUI


struct shareDialogView: View {
    @Binding var showDialog:Bool
    @State private var isHighlighted = shareOn.instagram
    
    var body: some View {
        ZStack{
            Rectangle()
                .background(.ultraThinMaterial)
                .onTapGesture {
                    showDialog = false
                }
            
            VStack(spacing: 30){
                HStack{
                    Spacer()
                    Image(systemName: "xmark")
                        .fontWeight(.black)
                        .font(.title)
                        .foregroundStyle(.white.opacity(0.7))
                        .onTapGesture {
                            showDialog = false
                        }
                }
                
                HStack(spacing:30){
                    Button {
                        isHighlighted = .instagram
                    } label: {
                        Image("instagram")
                            .resizable()
                            .frame(width: 33, height:33)
                            .scaledToFit()
                            .padding()
                            .padding(.horizontal,20)
                            .background(isHighlighted == shareOn.instagram ? .gray : .gray.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                    }
                    .buttonStyle(.plain)

                    Button {
                        isHighlighted = .snap
                    } label: {
                        Image("snapchat")
                            .resizable()
                            .frame(width: 33, height:33)
                            .scaledToFit()
                            .padding()
                            .padding(.horizontal,20)
                            .background(isHighlighted == shareOn.snap ? .gray : .gray.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                    }
                    .buttonStyle(.plain)
                }
                
                VStack(){
                    HStack{
                        Spacer()
                    }
                    
                    Text("How to add the Link to your story")
                        .font(.title)
                        .fontWeight(.black)
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 20){
                        ForEach(1 ..< 6) { index in
                            Circle()
                                .fill(index == 1 ? .black : .gray)
                                .frame(width: 40, height: 40)
                                .overlay(alignment: .center) {
                                    Text("\(index)")
                                        .fontWeight(.bold)
                                        .font(.title3)
                                        .foregroundStyle( index == 1 ? .white : .black)
                                }
                        }
                    }
                    
                    Text("Click the image")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.vertical, 15)
                    
                    Rectangle()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.bottom, 15)
                    
                    Button {
                        print("link")
                    } label: {
                        HStack{
                            Spacer()
                            Text("Next Step")
                                .fontWeight(.black)
                            Spacer()
                        }
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.vertical, 10)
                    }
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 45))
                    .shadow(radius: 3)
                    .padding(.horizontal)
                    
                }
                .padding()
                .padding()
                .background()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 4)
                
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    shareDialogView(showDialog: .constant(true))
}
