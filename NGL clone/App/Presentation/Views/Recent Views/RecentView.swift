//
//  RecentView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/16/24.
//

import SwiftUI

struct RecentView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel:RecentViewViewModel = RecentViewViewModel(services: Services())
    
    let linearColor = LinearGradient(colors:[Color(hex: "#0fc0f0"),Color(hex: "#50e9f2")], startPoint:.leading, endPoint: .trailing)
    
    @State private var showBottomSheet = false
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.recentViews) { recentView in
                    
                    ArrowButtonView(title: .constant("New view!"), image: .constant("eyes.inverse"), date: .constant(recentView.date),textColor:.constant(Color(hex: "#0fc0f0")), imageColor:.constant(.white), backgroundColor:.constant(.gradient(linearColor)))
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
            RecentViewBottomSheet()
                .presentationDetents([
                    .height(500)
                ])
                .presentationCornerRadius(30)

        }
    }
}

#Preview {
    RecentView()
}
