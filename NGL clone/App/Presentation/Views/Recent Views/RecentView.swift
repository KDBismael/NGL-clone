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
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(1..<10) { index in
                    ArrowButtonView(title: .constant("New view!"), image: .constant("eyes.inverse"), date: .constant("last month"),textColor:.constant(Color(hex: "#0fc0f0")), imageColor:.constant(.white), backgroundColor:.constant(.gradient(linearColor)))
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
    }
}

#Preview {
    RecentView()
}
