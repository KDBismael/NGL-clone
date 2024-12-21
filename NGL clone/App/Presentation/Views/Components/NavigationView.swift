//
//  NavigationView.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/10/24.
//

import SwiftUI

struct NavigationView: View {
    @State private var showSetting = false
    @State private var selectedIndex: Int = 0
    @State private var showShareDialog = false
    @State private var showCopiedDialog = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack(spacing:0){
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
                        
                        HStack{
                            Text("PLAY")
                                .foregroundStyle(selectedIndex == 0 ? .black : .gray)
                                .onTapGesture {
                                    withAnimation {
                                        selectedIndex = 0
                                    }
                                }
                            Text("INBOX")
                                .foregroundStyle(selectedIndex == 1 ? .black : .gray.opacity(0.7))
                                .onTapGesture {
                                    withAnimation {
                                        selectedIndex = 1
                                    }
                                }
                        }
                        .font(.title)
                        .fontWeight(.black)
                        
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
                        
                    }
                    
                    VStack {
                        TabView(selection: $selectedIndex) {
                            PlayView(showShareDialog: $showShareDialog, showCopiedDialog: $showCopiedDialog)
                                .background(.white)
                                .tag(0)
                            InboxView()
                                .background(.white)
                                .tag(1)
                        }
                        .ignoresSafeArea()
                        .tabViewStyle(.page(indexDisplayMode: .never))
                    }
                }
                
                if(showCopiedDialog){
                    LinkCopiedView()
                }
                
                if (showShareDialog){
                    shareDialogView(showDialog: $showShareDialog)
                }
            }
            
        }
    }
}

#Preview {
    NavigationView()
}
