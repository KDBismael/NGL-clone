//
//  Services.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/24/24.
//

import Foundation


class Services {
    func fetchMessages() async throws -> [MessageModel] {
        return DevelopperPreview().mockMessages
    }
    
    func fetchRecentViews() async throws ->[RecentViewModel] {
        return DevelopperPreview().mockRecentViews
    }
}
