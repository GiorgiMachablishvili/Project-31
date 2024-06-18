//
//  CountryInfo.swift
//  Project 31
//
//  Created by Gio's Mac on 17.06.24.
//

import Foundation

struct Territory: Codable {
    let name: Name
    let status: String
    let currencies: [String: Currency]?
    let region: String
    let subregion: String?
    let languages: [String: String]?
    let flag: String
    let car: Car
    let flags: Flags
}

struct Name: Codable {
    let common: String
    let official: String
    let nativeName: [String: NativeName]?
}

struct NativeName: Codable {
    let official: String
    let common: String
}

struct Currency: Codable {
    let name: String
    let symbol: String?
}

struct Car: Codable {
    let signs: [String]?
    let side: String
}

struct Flags: Codable {
    let png: String
    let svg: String
}
