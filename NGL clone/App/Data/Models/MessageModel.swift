//
//  MessageModel.swift
//  NGL clone
//
//  Created by KDB-MacBook on 12/24/24.
//

import Foundation

struct MessageModel: Identifiable, Codable, Hashable{
    let id:Int
    let message: String
    let date: String
}
