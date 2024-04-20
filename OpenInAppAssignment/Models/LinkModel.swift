//
//  LinkModel.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 20/04/24.
//

import SwiftUI

struct Link: Codable {
    let urlSuffix: String
    let isFavourite: Bool
    let webLink: URL
    let createdAt: String
    let smartLink: URL
    let title: String
    let timesAgo: String
    let totalClicks: Int
    let originalImage: URL
    let domainId: String
    let urlId: Int
    let thumbnail: URL?
    let urlPrefix: String?
    let app: String

    enum CodingKeys: String, CodingKey {
        case urlSuffix = "url_suffix"
        case isFavourite = "is_favourite"
        case webLink = "web_link"
        case createdAt = "created_at"
        case smartLink = "smart_link"
        case title
        case timesAgo = "times_ago"
        case totalClicks = "total_clicks"
        case originalImage = "original_image"
        case domainId = "domain_id"
        case urlId = "url_id"
        case thumbnail
        case urlPrefix = "url_prefix"
        case app
    }
}
