//
//  CountryInfo.swift
//  Project 31
//
//  Created by Gio's Mac on 17.06.24.
//

import Foundation

struct Territory: Codable {
    let name: Name
    let tld: [String]
    let cca2: String
    let ccn3: String
    let cca3: String
    let independent: Bool
    let status: String
    let unMember: Bool
    let currencies: [String: Currency]
    let idd: Idd
    let capital: [String]
    let altSpellings: [String]
    let region: String
    let subregion: String
    let languages: [String: String]
    let translations: [String: Translation]
    let latlng: [Double]
    let landlocked: Bool
    let area: Double
    let demonyms: Demonyms
    let flag: String
    let maps: Maps
    let population: Int
    let car: Car
    let timezones: [String]
    let continents: [String]
    let flags: Flags
    let coatOfArms: CoatOfArms?
    let startOfWeek: String
    let capitalInfo: CapitalInfo
    let postalCode: PostalCode
}

struct Name: Codable {
    let common: String
    let official: String
    let nativeName: [String: NativeName]
}

struct NativeName: Codable {
    let official: String
    let common: String
}

struct Currency: Codable {
    let name: String
    let symbol: String
}

struct Idd: Codable {
    let root: String
    let suffixes: [String]
}

struct Translation: Codable {
    let official: String
    let common: String
}

struct Demonyms: Codable {
    let eng: Demonym
}

struct Demonym: Codable {
    let f: String
    let m: String
}

struct Maps: Codable {
    let googleMaps: String
    let openStreetMaps: String
}

struct Car: Codable {
    let signs: [String]
    let side: String
}

struct Flags: Codable {
    let png: String
    let svg: String
}

struct CoatOfArms: Codable {
}

struct CapitalInfo: Codable {
    let latlng: [Double]
}

struct PostalCode: Codable {
    let format: String
    let regex: String
}
