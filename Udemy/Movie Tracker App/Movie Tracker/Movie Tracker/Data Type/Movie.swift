//
//  Movie.swift
//  Movie Tracker
//
//  Created by Tee Becker on 10/27/20.
//

import Foundation

struct Movie: Identifiable {
    
    var id = UUID()
    var title = ""
    var rating: Double = 3.0
    var seen = false
    
}

// ObservableObject - Shared with a few of other views.
class MovieStorage: ObservableObject {

    // @Published - if this array changes, alert SwiftUI
    @Published var movies = [Movie]()
}
