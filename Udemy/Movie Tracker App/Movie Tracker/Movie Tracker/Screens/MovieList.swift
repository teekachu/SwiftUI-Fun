//
//  MovieList.swift
//  Movie Tracker
//
//  Created by Tee Becker on 10/27/20.
//

import SwiftUI

struct MovieList: View {
    
    // Declared a var and created an instance of MovieStorage()
    @ObservedObject var movieStorage = MovieStorage()
    
    var body: some View {
        NavigationView{
            
            List(movieStorage.movies) { currentMovie in
                
                NavigationLink(destination: MovieDetail(movie: currentMovie, newMovie: false, movieStorage: movieStorage)) {
                    Text(currentMovie.title)
                }
                
            }.navigationBarTitle("Movies").navigationBarItems(trailing: NavigationLink(destination: MovieDetail(movie: Movie(), newMovie: true, movieStorage: movieStorage)) { // actually adding a movie with plus button
                Image(systemName: "plus")
            }
            ) // end of list
        } // end of NavView
    }
}


struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
