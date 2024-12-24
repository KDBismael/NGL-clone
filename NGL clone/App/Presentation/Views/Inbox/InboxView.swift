//
//  InboxView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/12/24.
//

import SwiftUI

struct InboxView: View {
    
    @StateObject var viewModel = MessageViewModel(services: Services())
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
                    
                    ForEach(viewModel.messages) { message in
                        
                        NavigationLink(value: message) {
                            ArrowButtonView(
                                title: .constant(message.message),
                                image: .constant("envelope.fill"),
                                date: .constant(message.date),
                                textColor:.constant(.black),
                                imageColor:.constant(.pink),
                                backgroundColor:.constant(.color(.gray.opacity(0.3)))
                            )
                        }
                    }
                }
            }
            .navigationDestination(for: MessageModel.self) { message in
                MessageView(message: .constant(message))
                    .toolbarVisibility(.hidden, for: .navigationBar)
            }
        }
    }
}

#Preview {
    InboxView()
}
