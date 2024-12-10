//
//  AppleFrameworkViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by Ganesh Patil on 09/12/24.
//

import SwiftUI

final class AppleFrameworkViewModel: ObservableObject {
    var selectedFramework: Framework? {
        didSet {
            isPresentedModel = true
        }
    }
    
    @Published var isPresentedModel: Bool = false
}
