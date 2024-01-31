//
//  ContentView.swift
//  FoodScan
//
//  Created by Minyu Wang on 31/01/2024.
//

import SwiftUI

struct GroceryScanView: View {
    @StateObject var viewModel = GroceryScanViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem) // it is going to initialise view
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scan ⏫", systemImage: "barcode")
                    .font(.title)
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
                Text(viewModel.scannedProductText)
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color.primary)
                    .padding()
                
                Image(viewModel.scannedImage)
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .shadow(radius: 10)
                    .padding()
                
            }
            .navigationTitle("Product Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
            }
        }
    }
}

struct GroceryScanView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryScanView()
    }
}
