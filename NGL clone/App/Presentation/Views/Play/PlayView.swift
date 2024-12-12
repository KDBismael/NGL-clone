//
//  PlayView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/11/24.
//

import SwiftUI

struct PlayView: View {
    
    var gradientColor:LinearGradient = LinearGradient(colors:[Color(hex: "#ec197d"),Color(hex: "#fc8118")], startPoint:.leading, endPoint: .trailing)
    @State var scrollPosition: Int?
    
    var body: some View {
        ScrollView {
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
                        .foregroundStyle(gradientColor)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                    }.overlay {
                        Capsule()
                            .stroke(lineWidth: 3)
                            .fill(gradientColor)
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
                    .background(gradientColor)
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
}

#Preview {
    PlayView()
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
