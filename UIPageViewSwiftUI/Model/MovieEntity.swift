//
//  MoviesModel.swift
//  UIPageViewSwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiek on 08/02/2021.
//

import Foundation

// MARK: - MoviesModel
struct Movies: Codable {
    let feed: Feed?
}

// MARK: - Feed
struct Feed: Codable {
    let title: String?
    let id: String?
    let author: Author?
    let links: [Link]?
    let copyright, country: String?
    let icon: String?
    let updated: String?
    let results: [Result]?
}

// MARK: - Author
struct Author: Codable {
    let name: String?
    let uri: String?
}

// MARK: - Link
struct Link: Codable {
    let linkSelf: String?
    let alternate: String?

    enum CodingKeys: String, CodingKey {
        case linkSelf
        case alternate
    }
}

// MARK: - Result
struct Result: Codable, Identifiable {
    let artistName, id, releaseDate, name: String?
    let kind, copyright: String?
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?
    let contentAdvisoryRating: String?
}

// MARK: - Genre
struct Genre: Codable {
    let genreId, name: String?
    let url: String?
}
