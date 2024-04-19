//
//  ChartModel.swift
//  OpenInAppAssignment
//
//  Created by shreenidhi vm on 19/04/24.
//

import Foundation

struct ChartModel: Identifiable,Equatable{
    let id = UUID().uuidString
    let creationDate: Date
    let totalClicks: Int
}
