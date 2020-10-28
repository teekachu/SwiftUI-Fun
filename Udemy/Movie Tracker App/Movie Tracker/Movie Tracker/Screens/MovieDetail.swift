//
//  MovieDetail.swift
//  Movie Tracker
//
//  Created by Tee Becker on 10/27/20.
//

import SwiftUI

struct MovieDetail: View {

//   @State is one of 3 the ways to STORE data. It holds the data for that View inside it.
//   $ means binding. It shows the Data and the View are connected. when one changes, the other will be notified.
    
    @State var movie: Movie
    
    // This is to dismiss the view when tap "Save"
    @Environment(\.presentationMode) var presentationMode
    let newMovie: Bool
    
    // Because this holds an array of movies, if this change, SwiftUI needs to change too
    // Only passing MovieStorage because it was created in MovieList.swift file
    @ObservedObject var movieStorage: MovieStorage
    
    
    var body: some View {
        
        // create list
        List {
            
            // each list have section for a different thing.
            Section{
                SectionTitle(titleName: "Search for a movie")
                
                TextField("Enter movie title", text: $movie.title)
            }
            
            Section{
                
                SectionTitle(titleName: "Give a Rating")
                
                HStack{
                    Spacer()
                    // repeat the sun emoji based on Int in rating variable
                    Text(String(repeating: "☀️", count: Int(movie.rating))).font(.title)
                    Spacer()
                }
                
                
                // create slider
                Slider(value: $movie.rating, in: 1...5, step: 1)
            }
            
            Section{
                SectionTitle(titleName: "Seen")
                Toggle(isOn: $movie.seen) {
                    
                    if movie.title == ""{
                        Text("Has seen this movie").foregroundColor(.gray)
                    } else{
                        Text("Has seen \(movie.title)").foregroundColor(.blue)
                    }
                    
                }
            }
            
            Section{
                Button(action: {
                    if newMovie{
                        // add this to the movieStorage's movies array
                        movieStorage.movies.append(movie)
                        
                    } else {
                        // loop over all movies
                        for x in 0..<self.movieStorage.movies.count{
                            
                            // check the id, if this id exist
                            if self.movieStorage.movies[x].id == movie.id{
                                
                                // assign the current movie status (self.movie) to that movie[index]
                                self.movieStorage.movies[x] = self.movie
                            }
                            
                        }
                        
                    }
                    
                    // to dismiss the view and move back to previous screen
                    self.presentationMode.wrappedValue.dismiss()
                    
                }){
                    
                    HStack {
                        Spacer()
                        Text("Save").font(.title2)
                        Spacer()
                    }
                }.disabled(movie.title.isEmpty)
            }
            
        }.listStyle(GroupedListStyle())  // Seperates the list into different sections , with each section in its own space
        
    }
}


struct Controls_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(), newMovie: true, movieStorage: MovieStorage())
    }
}


// Extracted via "Extract Subview"
struct SectionTitle: View {
    var titleName: String
    
    var body: some View {
        Text(titleName).foregroundColor(.gray).bold()
    }
}
