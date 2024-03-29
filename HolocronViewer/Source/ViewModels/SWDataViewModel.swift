//
//  SWDataViewModel.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import Holocron
import Combine
import SwiftUI

class SWDataViewModel<T: Codable>: ObservableObject {
        
    private var fetchBlock: FetchBlock<T>
    
    @Published private(set) var object: T?
    
    private func setData(_ data: T?) {
        DispatchQueue.main.async { [weak self] in
            self?.object = data
            
        }

    }
            
    init(_ block: @escaping FetchBlock<T>) {
        self.fetchBlock = block
        
    }
    
    func fetch() {
        SWAPI.shared.optimistic(fetchBlock, setData)
        
    }
    
}
