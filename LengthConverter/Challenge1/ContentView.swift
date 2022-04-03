//
//  ContentView.swift
//  Challenge1
//
//  Created by Efe Ertekin on 24.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = 0.0
    @State var chosenInputUnit: String = "meters"
    @State var chosenOutputUnit: String = "meters"
    @FocusState private var amountIsFocused: Bool
    
    let units = ["meters", "kilometers", "feet", "yards", "miles"]
    let unitsInFormat = [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles]
    
    
    var outputUnit: Double {
        // Calculation of output unit
        var startPoint = Measurement(value: inputUnit, unit: UnitLength.meters)
        let returnIndex = units.firstIndex(of: chosenOutputUnit) ?? 0
        
        if chosenInputUnit == "kilometers" {
            startPoint = Measurement(value: inputUnit, unit: UnitLength.kilometers)
        } else if chosenInputUnit == "feet" {
            startPoint = Measurement(value: inputUnit, unit: UnitLength.feet)
        } else if chosenInputUnit == "yards" {
            startPoint = Measurement(value: inputUnit, unit: UnitLength.yards)
        } else if chosenInputUnit == "miles" {
            startPoint = Measurement(value: inputUnit, unit: UnitLength.miles)
        } else {
            //input is meters
        }
        let result = startPoint.converted(to: unitsInFormat[returnIndex])
        return result.value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input Unit", value: $inputUnit, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Choose the unit", selection: $chosenInputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Unit")
                }
                
                Section {
                    Text("\(outputUnit.formatted())")
                    
                    Picker("Choose the unit", selection: $chosenOutputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
                }
            }
            .navigationTitle("Convert Lengths")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
