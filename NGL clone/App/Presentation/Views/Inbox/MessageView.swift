//
//  MessageView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/13/24.
//

import SwiftUI

enum shareOn{
    case instagram, snap
}

struct MessageView: View {
    var colors1: [String] = ["#ec197d","#fc8118"]
    var colors2: [String] = ["#9b59b6","#52be80"]
    
    @State private var gradientColor:LinearGradient = LinearGradient(colors:[Color(hex: "#ec197d"),Color(hex: "#fc8118")], startPoint:.leading, endPoint: .trailing)
    @State private var isHighlighted = shareOn.instagram
    
    var body: some View {
        ScrollView {
            HStack{
                Image(systemName: "exclamationmark.triangle.fill")
                Spacer()
                VStack{
                    HStack(spacing:10){
                        Image("Instagram-logo")
                            .resizable()
                            .frame(width: 33, height:33)
                            .scaledToFit()
                            .padding()
                            .onTapGesture {
                                withAnimation(.smooth) {
                                    isHighlighted = .instagram
                                }
                            }
                        
                        
                        Image("logo snap")
                            .resizable()
                            .frame(width: 33, height:33)
                            .scaledToFit()
                            .padding()
                            .onTapGesture {
                                withAnimation(.smooth) {
                                    isHighlighted = .snap
                                }
                            }
                        
                        
                    }
                    .background(.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .background(alignment: isHighlighted == shareOn.instagram ? .leading: .trailing) {
                        HStack{
                        }
                        .padding(.vertical,11)
                        .padding(.horizontal,10)
                        .padding()
                        .padding(.horizontal, 8)
                        .modifier(HighlightModifier(isHighlighted: true))
                        .padding(.horizontal,3)
                    }
                }
                Spacer()
                Image(systemName: "xmark")
                    .fontWeight(.bold)
            }
            .font(.title)
            .foregroundStyle(.gray)
            .padding()
            
            Spacer()
            
            VStack{
                HStack{
                    Spacer()
                    Text("send me anonymous messages!")
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding(.vertical,20)
                .padding(.horizontal)
                .background(gradientColor)
                
                HStack{
                    Spacer()
                    Text("Baltimore and Touareg = Baliverne")
                    Spacer()
                }
                .padding(.vertical,25)
                .padding(.horizontal)
            }
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .shadow(radius: 4.0)
            .padding()
            .padding(.top, 100)
            
            Spacer()
            
            HStack(spacing:10){
                Circle()
                    .fill(
                        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                    )
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        let color1=colors1[Int.random(in: 0..<colors1.count)]
                        let color2=colors2[Int.random(in: 0..<colors1.count)]
                        
                        gradientColor = LinearGradient(colors:[Color(hex: color1),Color(hex: color2)], startPoint:.leading, endPoint: .trailing)
                    }
                VStack{
                    Image(systemName: "camera.fill")
                        .foregroundStyle(.gray)
                        .fontWeight(.bold)
                        .font(.title2)
                }
                .padding(10)
                .background(.gray.opacity(0.3))
                .clipShape(Circle())
            }
            
            Spacer()
            
            Button {
                print("link")
            } label: {
                HStack{
                    Spacer()
                    Text("Who sent this 👀")
                    Spacer()
                }
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.vertical, 10)
            }
            .background(gradientColor)
            .clipShape(RoundedRectangle(cornerRadius: 45))
            .shadow(radius: 3)
            .padding()
            
            Button {
                print("link")
            } label: {
                HStack{
                    Spacer()
                    HStack{
                        Image(isHighlighted == shareOn.instagram ? "Instagram-logo" : "logo snap")
                            .resizable()
                            .frame(width: 25, height:25)
                            .scaledToFit()
                        
                        Text("reply")
                    }
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
        .padding(.horizontal)
        .background(.gray.opacity(0.15))
    }
}

#Preview {
    MessageView()
}

struct HighlightModifier: ViewModifier{
    let isHighlighted: Bool
    
    func body(content: Content) -> some View {
        content
            .background(isHighlighted ? Color.gray.opacity(0.7) : Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}
