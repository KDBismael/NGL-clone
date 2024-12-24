//
//  MessageViewModel.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/24/24.
//

import Foundation

class MessageViewModel: ObservableObject{
    @Published var messages = [MessageModel]()
    private let services:Services
    
    init(services: Services) {
        self.services = services
        Task {
            await fetchMessages()
        }
    }
    
    func fetchMessages() async {
        do {
            self.messages = try await services.fetchMessages()
        } catch {
            print("ERROR MESSAGES FETCH")
        }
    }
}
