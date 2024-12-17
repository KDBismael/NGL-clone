//
//  RecentView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/16/24.
//

import SwiftUI

struct RecentView: View {
    @Environment(\.dismiss) var dismiss
    
    let linearColor = LinearGradient(colors:[Color(hex: "#0fc0f0"),Color(hex: "#50e9f2")], startPoint:.leading, endPoint: .trailing)
    
    var buttonGradientColor:LinearGradient = LinearGradient(colors:[Color(hex: "#ec197d"),Color(hex: "#fc8118")], startPoint:.leading, endPoint: .trailing)
    @State private var showBottomSheet = false
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(1..<10) { index in
                    
                    ArrowButtonView(title: .constant("New view!"), image: .constant("eyes.inverse"), date: .constant("last month"),textColor:.constant(Color(hex: "#0fc0f0")), imageColor:.constant(.white), backgroundColor:.constant(.gradient(linearColor)))
                        .onTapGesture {
                            showBottomSheet = true
                        }
                }
            }
            .padding(.vertical, 85)
        }
        .overlay(alignment: .top) {
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                }
                Spacer()
                Text("Recent Views")
                Spacer()
            }
            .padding()
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(.black)
            .background(.white)
        }
        .overlay(alignment: .bottom) {
            HStack{
                Spacer()
                Text("💡This viewers list might not include some anonymous viewers")
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical,15)
            .font(.title3)
            .background(.white)
        }
        .sheet(isPresented: $showBottomSheet) {
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
}

#Preview {
    RecentView()
}
