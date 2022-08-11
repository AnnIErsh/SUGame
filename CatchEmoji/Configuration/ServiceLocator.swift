//
//  ServiceLocator.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 09.08.2022.
//

import Foundation

class ServiceLocator {
    static let shared = ServiceLocator()
    
    lazy var services: [String: AnyObject] = {
        return [String: AnyObject]()
    }()
    
    func addServices<T: AnyObject>(service: T) {
        let key = String(describing: T.self)
        if services[key] == nil {
            services[key] = service
        }
    }
    
    func getService<T:AnyObject>(type: T.Type) -> T? {
        let key = String(describing: type)
        return services[key] as? T
    }
}
