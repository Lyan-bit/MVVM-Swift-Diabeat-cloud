//
//  Classofy.swift
//  Breast cancer
//
//  Created by Lyan Alwakeel on 07/11/2022.
//

import Foundation
import SwiftUI

struct ClassifyView: View {
    @State var objectId: String = ""
    @ObservedObject var model : CRUDViewModel
    @ObservedObject var classificationvm : ClassificationViewModel
    
    @State var result = ""

    var body: some View {
        NavigationView{
            Form {
                Section("Object to classify") {
                    Picker("Select a object", selection: $objectId) {
                        ForEach(model.currentClassifications) { Text($0.id).tag($0.id)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section("Specify Selected Object") {
                        Button(action: { result = classificationvm.classify(id: objectId) } ) { Text("Classify") }
                        .buttonStyle(.bordered)
                }
                Section("Result") {
                    Text("\(result)")
                }
            }
            .navigationTitle("Classify Objects")
            .onAppear(perform:
                        { objectId = model.currentClassification.id })
        }
    }
}

struct ClassifyView_Previews: PreviewProvider {
    static var previews: some View {
        ClassifyView(model: CRUDViewModel.getInstance(), classificationvm: ClassificationViewModel())
    }
}
