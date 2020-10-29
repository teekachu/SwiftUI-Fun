//
//  ContentView.swift
//  DesignCode.v1
//
//  Created by Tee Becker on 10/28/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false // for animation
    
    @State var viewState = CGSize.zero // for dragging gesture
    
    var body: some View {
        
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            
            
            BackCardView()
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20) // cornerRadius is clipping the background
                .shadow(radius: 20 )
                .offset(x: 0, y: show ? -400 : -40) // note this comes first
                .offset(x: viewState.width, y: viewState.height)  // CGSize have viewstate of width and height
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotation3DEffect(
                    Angle(degrees: 10),
                    axis: (x: 10.0, y: 0, z: 0)
                )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            
            BackCardView()
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20) // cornerRadius is clipping the background
                .shadow(radius: 20 )
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)  // CGSize have viewstate of width and height
                .rotationEffect(.degrees(show ? 0 : 5)) // note the ternary operator x ? :
                .rotation3DEffect(
                    Angle(degrees: 5),
                    axis: (x: 5.0, y: 0, z: 0)
                )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            
            CardView()
                .offset(x: viewState.width, y: viewState.height)  // CGSize have viewstate of width and height
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    show.toggle()
                })
                
                // everytime the user drag, will get fed a value about the drag, and we assign the value to viewState variable assigned
                .gesture(DragGesture().onChanged { value in
                    viewState = value.translation
                    show = true
                    
                }.onEnded({ (value) in
                    viewState = .zero // reset the position
                    show = false
                })
                )
            
            
            BottomCardView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView().previewDevice("iPhone 11")
            ContentView().previewDevice("iPhone 11 Max Pro")
            ContentView().previewDevice("iPhone SE (2nd generation)")
        }
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("certificate")
                        .foregroundColor(Color("accent"))
                        .font(.title2)
                    
                }
                
                Spacer()
                Image("Logo1")
                
            } //  end of top section ( 2 Texts + Logo)
            
            .padding()
            Spacer()
            Image("Card1").resizable().aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
            
        } // end of stack for whole card
        
        .frame(width: 340, height: 220, alignment: .center)
        .background(Color.black).cornerRadius(20)
        .shadow(radius: 20 )
    }
}

struct BackCardView: View {
    var rotationDegrees: Double = 5
    
    var body: some View {
        VStack {
            Spacer()
        }
        .scaleEffect(0.9)
        .frame(width: 340, height: 220)
        .rotationEffect(.init(degrees: rotationDegrees))
        
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1").resizable().aspectRatio(contentMode: .fit)
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack (spacing: 20){ // the spacing goes between all contents
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design-Code Instructor")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
            
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity) // this ensures to push the rectangle to max width on ALL devices
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x: 0, y: 510)
    }
}
