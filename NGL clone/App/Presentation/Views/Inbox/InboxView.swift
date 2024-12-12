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
                            ReceivedMessageButtonView()
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

struct ReceivedMessageButtonView: View {
    var body: some View {
        VStack(spacing:15) {
            HStack(spacing:10){
                Image(systemName: "envelope.fill")
                    .foregroundStyle(.pink)
                    .font(.title)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .clipShape(Circle())
                
                
                VStack(alignment:.leading){
                    Text("Depuis t'es allé au Ghana tu te pppppppppp")
                        .font(.title2)
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                    
                    Text("last month")
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                Image(systemName: "chevron.forward")
                    .foregroundStyle(.gray)
                    .font(.title2)
            }
            
            Divider()
        }
        .padding(.horizontal,10)
    }
}
