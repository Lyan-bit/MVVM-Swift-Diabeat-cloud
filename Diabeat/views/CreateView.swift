//
//  ContentView.swift
//  Breast cancer
//
//  Created by Lyan Alwakeel on 07/11/2022.
//

import SwiftUI

struct CreateView: View {
    @State var bean : ClassificationVO = ClassificationVO()
    @ObservedObject var model : CRUDViewModel
    
    var body: some View {
        NavigationView{
        ScrollView{
        VStack {
            HStack {
                Text("Pregnancies:")
                    .font(.headline)
                    .bold()
            TextField("Pregnancies", value: $bean.pregnancies, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack {
                Text("Glucose:")
                    .font(.headline)
                    .bold()
            TextField("Glucose", value: $bean.glucose, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack {
                Text("Blood Pressure:")
                    .font(.headline)
                    .bold()
            TextField("Blood Pressure", value: $bean.bloodPressure, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack{
                Text("Skin Thickness:")
                    .font(.headline)
                    .bold()
            TextField("Skin Thickness", value: $bean.skinThickness, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack{
                Text("Insulin:")
                    .font(.headline)
                    .bold()
            TextField("Insulin", value: $bean.insulin, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack {
                Text("BMI:")
                    .font(.headline)
                    .bold()
            TextField("BMI", value: $bean.bmi, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack {
                Text("Diabetes Pedigree:")
                    .font(.headline)
                    .bold()
            TextField("Diabetes Pedigree", value: $bean.diabetesPedigree, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack{
                Text("Age:")
                    .font(.headline)
                    .bold()
            TextField("Age", value: $bean.age, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack(spacing: 20) {
                Text("Result:")
                    .font(.headline)
                    .bold()
                Text("\(bean.result)")
                    .font(.headline)
                    .bold()
            }
        }
        VStack(alignment: HorizontalAlignment.leading, spacing: 20){
            HStack {
              Button(action: { self.model.createClassification(x: bean) } ) { Text("Create") }
              Button(action: { self.model.cancelcreateClassification() } ) { Text("Cancel") }
            }.buttonStyle(DefaultButtonStyle())
        }.padding(.top)
        }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView(model: CRUDViewModel.getInstance())
    }
}
