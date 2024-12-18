//
//  RecentViewBottomSheet.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/18/24.
//

import SwiftUI

struct RecentViewBottomSheet: View {
    var buttonGradientColor:LinearGradient = LinearGradient(colors:[Color(hex: "#ec197d"),Color(hex: "#fc8118")], startPoint:.leading, endPoint: .trailing)
    
    var body: some View {
        VStack(spacing:15){
            HStack{
                Spacer()
                Image("ngl logo")
                    .resizable()
                    .frame(width: 40 ,height: 40)
                    .scaledToFit()
                
                Spacer()
            }
            .overlay(alignment: .trailing) {
                Button("restore") {

                }
                .foregroundStyle(.gray)
                .font(.subheadline)
            }
            
            VStack {
                VStack{
                    Image(systemName: "eyes.inverse")
                        .font(.custom("eyes", size: 30))
                        .foregroundStyle(.white)
                }
                .padding()
                .padding(15)
                .background(.purple)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                    
                Text("Viewer Hints")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Get hints like their location, device, ngl id, and more")
                    .font(.callout)
                    .multilineTextAlignment(.center)
            }
            
            VStack(spacing: 5){
                Button {
                    
                } label: {
                    HStack{
                        Spacer()
                        Text("Unlock")
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.yellow)
                        Spacer()
                    }
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                }
                .background(buttonGradientColor)
                .clipShape(RoundedRectangle(cornerRadius: 45))
                
                Text("pro renews for $US 6,99/wk")
                    .font(.title2)
                    .fontWeight(.bold)
                Button("Terms and Privacy") {
                    
                }
                .foregroundStyle(.gray)
                .font(.subheadline)
            }
        }
        .padding()
        .padding(5)
        .presentationDetents([.medium])
        .presentationCornerRadius(30)
    }
}

#Preview {
    RecentViewBottomSheet()
}
