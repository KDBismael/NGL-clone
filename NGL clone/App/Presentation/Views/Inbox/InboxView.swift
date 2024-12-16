//
//  InboxView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/12/24.
//

import SwiftUI

struct InboxView: View {
    @State private var isNotificationOn = false
    @State private var singleSelection: UUID?
    var body: some View {
        
        NavigationStack{
            ScrollView {
                LazyVStack{
                    HStack{
                        Toggle(isOn: $isNotificationOn) {
                            VStack(alignment: .leading){
                                HStack{
                                    Text("Turn on Notifications")
                                    Image(systemName: "bell.fill")
                                        .foregroundStyle(.yellow)
                                }
                                .font(.title2)
                                .fontWeight(.semibold)
                                Text("Get notified when you get new messages")
                                    .foregroundStyle(.gray)
                                    .font(.subheadline)
                            }
                        }
                    }
                    .padding()
                    .background(.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                    
                    ForEach(1 ..< 10) { index in
                        // we also have this way of doing it
//                        NavigationLink {
//                            Text("Screen with index \(index)")
//                        } label: {
//                        }
                        NavigationLink(value: index ) {
                            ArrowButtonView(title: .constant("Depuis t'es allé au Ghana tu te pppppppppp"), image: .constant("envelope.fill"), date: .constant("last month"),textColor:.constant(.black), imageColor:.constant(.pink), backgroundColor:.constant(.color(.gray.opacity(0.3))))
                        }
                        
                    }
                }
            }
            .navigationDestination(for: Int.self) { index in
                Text("Screen with index \(index)")
//                    .toolbarVisibility(.hidden, for: .navigationBar)
            }
        }
    }
}

#Preview {
    InboxView()
}
