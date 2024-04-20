//
//  JSONHelper.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 19/04/24.
//

import Foundation

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



class JSONHelper {
    
     func fetchDashboardData() async throws -> String {
        let urlString = "https://api.inopenapp.com/api/v1/dashboardNew"
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
        }

        guard let jsonString = String(data: data, encoding: .utf8) else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to decode data"])
        }

        return jsonString
    }
    
    func extractDataField(from jsonString: String) throws -> String {
        // Convert the input string to Data
        guard let jsonData = jsonString.data(using: .utf8) else {
            throw NSError(domain: "InvalidString", code: 1, userInfo: [NSLocalizedDescriptionKey: "String to Data conversion failed"])
        }
        
        // Parse the JSON data
        guard let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
            throw NSError(domain: "ParsingError", code: 2, userInfo: [NSLocalizedDescriptionKey: "Failed to parse JSON"])
        }
        
        // Extract the 'data' field
        guard let data = json["data"] else {
            throw NSError(domain: "DataNotFound", code: 3, userInfo: [NSLocalizedDescriptionKey: "'data' field not found"])
        }
        
        // Convert the 'data' field back to JSON string
        let dataJsonData = try JSONSerialization.data(withJSONObject: data, options: [.prettyPrinted])
        guard let dataJsonString = String(data: dataJsonData, encoding: .utf8) else {
            throw NSError(domain: "DataConversionError", code: 4, userInfo: [NSLocalizedDescriptionKey: "Data to String conversion failed"])
        }
        
        return dataJsonString
    }
    
    func extractTopLinks(from dataJsonString: String) throws -> String {
        guard let dataJsonData = dataJsonString.data(using: .utf8) else {
            throw NSError(domain: "InvalidString", code: 1, userInfo: [NSLocalizedDescriptionKey: "String to Data conversion failed"])
        }
        
        guard let dataJson = try JSONSerialization.jsonObject(with: dataJsonData, options: []) as? [String: Any] else {
            throw NSError(domain: "ParsingError", code: 2, userInfo: [NSLocalizedDescriptionKey: "Failed to parse JSON"])
        }
        
        guard let topLinks = dataJson["top_links"] else {
            throw NSError(domain: "TopLinksNotFound", code: 3, userInfo: [NSLocalizedDescriptionKey: "'top_links' field not found"])
        }
        
        let topLinksJsonData = try JSONSerialization.data(withJSONObject: topLinks, options: [.prettyPrinted])
        guard let topLinksJsonString = String(data: topLinksJsonData, encoding: .utf8) else {
            throw NSError(domain: "TopLinksConversionError", code: 4, userInfo: [NSLocalizedDescriptionKey: "Top links to String conversion failed"])
        }
        
        return topLinksJsonString
    }
    
    func extractRecentLinks(from dataJsonString: String) throws -> String {
        guard let dataJsonData = dataJsonString.data(using: .utf8) else {
            throw NSError(domain: "InvalidString", code: 1, userInfo: [NSLocalizedDescriptionKey: "String to Data conversion failed"])
        }
        
        guard let dataJson = try JSONSerialization.jsonObject(with: dataJsonData, options: []) as? [String: Any] else {
            throw NSError(domain: "ParsingError", code: 2, userInfo: [NSLocalizedDescriptionKey: "Failed to parse JSON"])
        }
        
        guard let recentLinks = dataJson["recent_links"] else {
            throw NSError(domain: "RecentLinksNotFound", code: 3, userInfo: [NSLocalizedDescriptionKey: "'recent_links' field not found"])
        }
        
        let recentLinksJsonData = try JSONSerialization.data(withJSONObject: recentLinks, options: [.prettyPrinted])
        guard let recentLinksJsonString = String(data: recentLinksJsonData, encoding: .utf8) else {
            throw NSError(domain: "RecentLinksConversionError", code: 4, userInfo: [NSLocalizedDescriptionKey: "Recent links to String conversion failed"])
        }
        
        return recentLinksJsonString
    }
    
    func decodeLinks(from jsonString: String) -> [Link]? {
        guard let jsonData = jsonString.data(using: .utf8) else {
            print("Error: Unable to convert string to Data.")
            return nil
        }

        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601  // Ensures dates are decoded correctly
        decoder.keyDecodingStrategy = .useDefaultKeys

        do {
            let links = try decoder.decode([Link].self, from: jsonData)
            return links
        } catch {
            print("Decoding error: \(error)")
            return nil
        }
    }
    
    func convertISO8601StringToDate(_ dateString: String) -> Date? {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]  // Support for fractional seconds
        return isoFormatter.date(from: dateString)
    }
    
    func extractTitles(from jsonString: String) -> [String]? {
        guard let data = jsonString.data(using: .utf8) else {
            print("Error: Couldn't encode jsonString to Data")
            return nil
        }
        
        do {
            // Decode the JSON data into an array of dictionaries
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                var titles = [String]()
                // Extract titles
                for itemDict in jsonArray {
                    if let title = itemDict["title"] as? String {
                        titles.append(title)
                    }
                }
                return titles
            } else {
                print("Error: Decoding JSON did not return an array of dictionaries")
                return nil
            }
        } catch {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    func convertDateFormat(from dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"  // Set the date format matching the input
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)       // Set timezone to UTC

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd MMM yyyy"                 // Set the output date format
        outputFormatter.timeZone = TimeZone.current                // Set timezone to current

        if let date = inputFormatter.date(from: dateString) {
            return outputFormatter.string(from: date)
        } else {
            print("Invalid date format")
            return "Invalid date"
        }
    }
    
    func correctURLFormat(_ urlString: String) -> String {
        return urlString.replacingOccurrences(of: "\\", with: "/")
    }
    
    func extractWebLinks(from jsonString: String) -> [String] {
        var webLinks: [String] = []

        // Convert the JSON string to Data
        guard let jsonData = jsonString.data(using: .utf8) else {
            print("Error: Could not encode jsonString to Data")
            return []
        }

        // Parse the JSON data
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] {
                // Iterate through each dictionary
                for dictionary in jsonArray {
                    if let webLink = dictionary["web_link"] as? String {
                        webLinks.append(webLink)
                    }
                }
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }

        return webLinks
    }
    


    
    
}
