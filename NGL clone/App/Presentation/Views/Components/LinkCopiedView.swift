//
//  LinkCopiedView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/17/24.
//

import SwiftUI

struct LinkCopiedView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.black.opacity(0.3))
            
            VStack(spacing: 10){
                Text("🔗 Link copied!")
                    .font(.title)
                Image(systemName: "checkmark")
                    .font(.custom("checkmark", size: 85))
                    .foregroundStyle(.gray)
            }
            .padding()
            .padding()
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    LinkCopiedView()
}
