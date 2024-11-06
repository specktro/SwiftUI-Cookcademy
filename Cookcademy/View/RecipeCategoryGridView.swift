//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by specktro on 24/10/24.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @EnvironmentObject private var recipeData: RecipeData
    
    var body: some View {
        NavigationView {
            ScrollView {
                let columns = [GridItem(), GridItem()]
                
                LazyVGrid(columns: columns) {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        NavigationLink(destination: {
                            RecipesListView(category: category)
                                .environmentObject(recipeData)
                        }, label: {
                            CategoryView(category: category)
                        })
                    }
                }
                .navigationTitle("Categories")
            }
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue)
                .font(.title)
        }
    }
}

#Preview {
    RecipeCategoryGridView()
        .environmentObject(RecipeData())
}
