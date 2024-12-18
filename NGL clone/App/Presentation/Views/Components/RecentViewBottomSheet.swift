//
//  RecentViewBottomSheet.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/18/24.
//

import SwiftUI

struct RecentViewBottomSheet: View {
    var buttonGradientColor:LinearGradient = LinearGradient(colors:[Color(hex: "#ec197d"),Color(hex: "#fc8118")], startPoint:.leading, endPoint: .trailing)
    @State private var index = 0
    
    var body: some View {
        VStack(spacing:15){
            HStack{
                Spacer()
                HStack{
                    Image("ngl logo")
                        .resizable()
                        .frame(width: 50 ,height: 50)
                        .scaledToFit()
                    Text("PRO")
                        .font(.subheadline)
                        .fontWeight(.black)
                        .foregroundStyle(.white)
                        .padding(5)
                        .padding(.horizontal, 5)
                        .background(.red)
                }
                Spacer()
            }
            .overlay(alignment: .trailing) {
                Button("restore") {

                }
                .foregroundStyle(.gray)
                .font(.subheadline)
            }
            
            VStack{
                TabView (selection: $index) {
                    ForEach(0..<3) { index in
                        Card(index: $index)
                            .tag(index)
                    }
                }
                .frame(height:240)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .padding(.bottom, -15)
                
                HStack{
                    Circle()
                        .fill(index == 0 ? .blue : .gray)
                        .frame(width: 8,height: 8)
                        
                    Circle()
                        .fill(index == 1 ? .blue : .gray)
                        .frame(width: 8,height: 8)
                    
                    Circle()
                        .fill(index == 2 ? .blue : .gray)
                        .frame(width: 8,height: 8)
                        
                }
            }
            .padding(.bottom, 15)
            
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
    }
}

#Preview {
    RecentViewBottomSheet()
}

struct Card: View {
    @Binding var index: Int
    
    var body: some View {
        VStack {
            VStack{
                
                Image(systemName: index == 0 ? "envelope.fill" : index == 1 ? "eyes.inverse" : "arcade.stick")
                    .font(.custom("eyes", size: 50))
                    .foregroundStyle(.white)
            }
            .frame(width: 110, height: 110)
            .background(index == 0 ? .red : index == 1 ?  .purple : .blue)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            
            Text(index == 0 ? "Reveal Sender Info" : index == 1 ? "Viewer Hints" : "Exclusive link game")
                .font(.title2)
                .fontWeight(.bold)
            
            Text( index != 2 ? "Get hints like their location, device, ngl id, and more" : "Get unlimited early access to new link games and features!")
                .font(.callout)
                .multilineTextAlignment(.center)
                .frame(width: 270)
        }
    }
}
