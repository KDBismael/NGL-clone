//
//  RecentViewViewModel.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/24/24.
//

import Foundation

class RecentViewViewModel: ObservableObject{
    @Published var recentViews = [RecentViewModel]()
    private let services:Services
    
    init(services:Services) {
        self.services = services
        Task {
            await fetchRecentViews()
        }
    }
    
    func fetchRecentViews() async {
        do {
            self.recentViews = try await self.services.fetchRecentViews()
        } catch {
            print("ERROR: RECENT VIEW")
        }
    }
}
