//
//  Configurator.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 09.08.2022.
//

import Foundation
import Network
import Data

class Configurator {
  static func register() {
        ServiceLocator.shared.addServices(service: NetworkService())
        ServiceLocator.shared.addServices(service: DataService())
    }
}

@propertyWrapper
struct Configurated {
    var wrappedValue: () {
        return Configurator.register()
    }
}
