//
//  ArrowButtonView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/16/24.
//

import SwiftUI

enum BackgroundStyle {
    case color(Color)
    case gradient(LinearGradient)
}


struct ArrowButtonView: View {
    @Binding var title:String
    @Binding var image:String
    @Binding var date:String
    @Binding var textColor:Color
    @Binding var imageColor:Color
    @Binding var backgroundColor: BackgroundStyle
    
    var body: some View {
        VStack(spacing:15) {
            HStack(spacing:10){
                Image(systemName: image)
                    .foregroundStyle(imageColor)
                    .font(.title)
                    .padding()
                    .background(dynamicBackground)
                    .clipShape(Circle())
                
                VStack(alignment:.leading){
                    Text(title)
                        .font(.title2)
                        .foregroundStyle(textColor)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                    
                    Text(date)
                        .foregroundStyle(.gray)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                Image(systemName: "chevron.forward")
                    .foregroundStyle(.gray)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Divider()
        }
        .padding(.horizontal,10)
    }
    
    @ViewBuilder
        private var dynamicBackground: some View {
            switch backgroundColor {
            case .color(let color):
                color
            case .gradient(let gradient):
                gradient
            }
        }
}

#Preview {
    ArrowButtonView(title: .constant("Depuis t'es allé au Ghana tu te pppppppppp"), image: .constant("envelope.fill"), date: .constant("last month"),textColor:.constant(.black), imageColor:.constant(.pink), backgroundColor:.constant(.color(.gray.opacity(0.3))))
}
