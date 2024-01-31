//
//  GroceryScanViewModel.swift
//  FoodScan
//
//  Created by Minyu Wang on 31/01/2024.
//

import SwiftUI

final class GroceryScanViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem? // data from coordinator(ScannerView)
    
    var statusText: String {
       return scannedCode.isEmpty ? "Nothing Scanned Yet" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
    
    var scannedProductText: String {
        if scannedCode == "3574661440477" {
            return "cotton buds"
        } else if scannedCode == "80177173" {
            return "nutella"
        } else if scannedCode == "5010044000275" {
            return "Toastie"
        } else {
            return ""
        }
    }
    
    
    var scannedImage: String {
        if scannedCode == "3574661440477" {
            return "cotton"
        } else if scannedCode == "80177173" {
            return "nutella"
        } else if scannedCode == "5010044000275" {
            return "toastie"
        } else {
            return ""
        }
    }
}


