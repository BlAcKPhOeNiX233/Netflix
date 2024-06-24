//
//  Profile.swift
//  Netflix
//
//  Created by Bryan Sánchez Peralta on 22/02/24.
//

import Foundation

enum Profile: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case bryan = "Bryan"
    case alex = "Alex"
    case joselyn = "Joselyn"
    case max = "Max"
    case sophie = "Sophie"
}
