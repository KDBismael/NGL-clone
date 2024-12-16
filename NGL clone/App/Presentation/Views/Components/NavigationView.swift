//
//  NavigationView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/10/24.
//

import SwiftUI

struct NavigationView: View {
    @State private var showSetting = false
    
    var body: some View {
        NavigationStack{
            HStack{
                NavigationLink {
                    RecentView()
                        .toolbarVisibility(.hidden, for: .navigationBar)
                } label: {
                    Image(systemName: "eye")
                        .foregroundStyle(.gray)
                }
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
                
                Button {
                    print("see recent")
                } label: {
                }

                
                Spacer()
                
                Rectangle().frame(width: 150, height: 50)
                
                Spacer()
                
                Button {
                    showSetting = true
                } label: {
                    Image(systemName: "gearshape")
                    .foregroundStyle(.gray)
                }
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
                .confirmationDialog("settingsKey", isPresented: $showSetting) {
                    
                    Button("How to share the link") {
                        showSetting = false
                    }
                    Button("Follow us on Snapchat") {
                        showSetting = false
                    }
                    Button("Settings") {
                        showSetting = false
                    }
                    Button("Cancel", role: .cancel) {
                        showSetting = false
                    }
                }
                
            }.padding()
        }
    }
}

#Preview {
    NavigationView()
}
