//
//  PlayView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/11/24.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        VStack(spacing:30){
            RoundedRectangle(cornerRadius: 50)
                .frame(height:300)
                .padding(.horizontal,20)
            
            VStack(spacing:15){
                Text("Step 1: Copy your link")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Text("NGL.LINK/KDB86640")
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                Button {
                    print("link")
                } label: {
                    HStack{
                        Image(systemName: "link")
                        Text("Copy Link")
                            
                    }
                    .font(.system(size: 18))
                    .foregroundStyle(.red)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                }.overlay {
                    Capsule()
                        .stroke(lineWidth: 3)
                        .fill(.red)
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
                    print("link")
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
                .background(.red)
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
//        .background(.red)
    }
}

#Preview {
    PlayView()
}
