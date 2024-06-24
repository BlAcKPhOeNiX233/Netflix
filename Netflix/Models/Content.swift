//
//  Content.swift
//  Netflix
//
//  Created by Bryan Sánchez Peralta on 24/02/24.
//

import Foundation

enum Content: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case formula1 = "Formula 1: Drive To Survive"
    case onePiece = "One Piece"
    case lift = "LIFT"
    case blackClover = "Black Clover"
    case einsteinAndTheBomb = "Einstein And The Bomb"
    case hustle = "Hustle"
    case topGun = "Top Gun: Maverik"
    case yourName = "Your Name"
    case theWolfOfWallStreet = "The Wolf of Wall Street"
    case rickAndMorty = "Rick and Morty"
    case demonSlayer = "Demon Slayer: Kimetsu no Yaiba"
    case shameless = "Shameless (U.S.)"
    case suits = "Suits"
    
    var type: ContentType {
        switch self {
        case .formula1:
            return .tvSerie
        case .onePiece:
            return .tvSerie
        case .lift :
            return .film
        case .blackClover:
            return .film
        case .einsteinAndTheBomb:
            return .film
        case .hustle:
            return .film
        case .topGun:
            return .film
        case .yourName:
            return .film
        case .theWolfOfWallStreet:
            return .film
        case .rickAndMorty:
            return .tvSerie
        case .demonSlayer:
            return .tvSerie
        case .shameless:
            return .tvSerie
        case .suits:
            return .tvSerie
        }
    }
    
    var categories: [Category] {
        switch self {
        case .formula1:
            return [.documentary, .europeans]
        case .onePiece:
            return [.anime, .action]
        case .lift :
            return [.comedy, .action]
        case .blackClover:
            return [.anime, .action]
        case .einsteinAndTheBomb:
            return [.documentary, .europeans, .dramas]
        case .hustle:
            return [.dramas, .documentary]
        case .topGun:
            return [.dramas, .action]
        case .yourName:
            return [.dramas, .anime, .romantics]
        case .theWolfOfWallStreet:
            return [.dramas, .comedy]
        case .rickAndMorty:
            return [.scifi, .comedy, .action]
        case .demonSlayer:
            return [.action, .anime, .scifi]
        case .shameless:
            return [.dramas, .comedy]
        case .suits:
            return [.dramas, .comedy]
        }
    }
    
    var orginal: Bool {
        switch self {
        case .formula1:
            return true
        case .onePiece:
            return false
        case .lift :
            return true
        case .blackClover:
            return true
        case .einsteinAndTheBomb:
            return true
        case .hustle:
            return true
        case .topGun:
            return false
        case .yourName:
            return false
        case .theWolfOfWallStreet:
            return false
        case .rickAndMorty:
            return false
        case .demonSlayer:
            return false
        case .shameless:
            return false
        case .suits:
            return false
        }
    }
}
