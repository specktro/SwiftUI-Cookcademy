//
//  ModifyComponentsView.swift
//  Cookcademy
//
//  Created by specktro on 04/11/24.
//

import SwiftUI

protocol RecipeComponent: CustomStringConvertible {
    init()
}

protocol ModifyComponentView: View {
    associatedtype Component
    init(component: Binding<Component>, createAction: @escaping (Component) -> Void)
}

struct ModifyComponentsView<Component: RecipeComponent, DestinationView: ModifyComponentView>: View where DestinationView.Component == Component {
    @Binding var components: [Component]
    @State private var newComponent = Component()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            let addComponentView = DestinationView(component: $newComponent) { component in
                components.append(component)
                newComponent = Component()
            }.navigationTitle("Add Component")
            if components.isEmpty {
                Spacer()
                NavigationLink("Add the first component", destination: addComponentView)
                Spacer()
            } else {
                HStack {
                    Text("Components")
                        .font(.title)
                        .padding()
                    Spacer()
                }
                List {
                    ForEach(components.indices, id: \.self) { index in
                        let component = components[index]
                        Text(component.description)
                    }
                    .listRowBackground(listBackgroundColor)
                    NavigationLink("Add another component",
                                   destination: addComponentView)
                    .buttonStyle(PlainButtonStyle())
                    .listRowBackground(listBackgroundColor)
                }.foregroundColor(listTextColor)
            }
        }
    }
}

#Preview {
    NavigationView {
        ModifyComponentsView<Ingredient, ModifyIngredientView>(components: .constant([Ingredient]()))
    }
}
