//
//  ContentView.swift
//  Africa
//
//  Created by Deep Bose on 5/20/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
 //   let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolbarItem: String = "square.grid.2x2"
    
    // FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid number: \(gridColumn)")
        // TOOLBAR GRID IMAGE
        switch gridColumn {
        case 1:
          toolbarItem = "square.grid.2x2"
        case 2:
          toolbarItem = "square.grid.3x2"
        case 3:
          toolbarItem = "rectangle.grid.1x2"
        default:
          toolbarItem = "square.grid.2x2"
        }
    }
   
    
    
    // MARK: - BODY
    
    var body: some View {
        
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: LINK
                        }
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                            }//: LOOP
                        }//: LAZYVGRID
                        .padding(10)
                        .animation(.easeIn)
                    }//: SCROLLVIEW
                }//: CONDITION
            }//: GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack (spacing: 16){
                        // LIST
                        Button (action: {
                            print("List view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        })  {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary: .accentColor)
                        }
                        //GRID
                        Button (action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        })  {
                            Image(systemName: toolbarItem)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor: .primary)
                        }
                    }//: HSTACK
                }//: BUTTON
            }//: TOOLBAR
        }//: NAVIGATION
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
