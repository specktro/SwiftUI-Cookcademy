//
//  ModifyDirectionView.swift
//  Cookcademy
//
//  Created by specktro on 04/11/24.
//

import SwiftUI

struct ModifyDirectionView: ModifyComponentView {
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    @Environment(\.presentationMode) private var mode
    
    @Binding var direction: Direction
    let createAction: (Direction) -> Void
    
    init(component: Binding<Direction>, createAction: @escaping ((Direction) -> Void)) {
        self._direction = component
        self.createAction = createAction
    }
    
    var body: some View {
        Form {
            TextField("Direction Description", text: $direction.description)
                .listRowBackground(listBackgroundColor)
            Toggle("Optional", isOn: $direction.isOptional)
                .listRowBackground(listBackgroundColor)
            HStack {
                Spacer()
                Button("Save") {
                    createAction(direction)
                    mode.wrappedValue.dismiss()
                }
                Spacer()
            }.listRowBackground(listBackgroundColor)
        }
        .foregroundColor(listTextColor)
    }
}

#Preview {
    ModifyDirectionView(component: .constant(.init(description: "", isOptional: false))) { _ in return
    }
}
