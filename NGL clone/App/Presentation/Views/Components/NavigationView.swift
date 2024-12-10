//
//  NavigationView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/10/24.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        HStack{
            Button {
                print("see recent")
            } label: {
                Image(systemName: "eye")
                    .foregroundStyle(.gray)
            }
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(Circle())
            
            Spacer()
            
            Rectangle().frame(width: 150, height: 50)
            
            Spacer()
            
            Button {
                print("see recent")
            } label: {
                Image(systemName: "gearshape")
                    .foregroundStyle(.gray)
                    
            }
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(Circle())
            
        }.padding()
    }
}

#Preview {
    NavigationView()
}
