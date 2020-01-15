//
//  WishlistFlow.swift
//  RxMovieCoordinator
//
//  Created by Sherif Kamal on 1/14/20.
//  Copyright © 2020 Sherif Kamal. All rights reserved.
//

import UIKit
import RxFlow
import RxSwift

class WishlistFlow: Flow {
    
    var root: Presentable {
        return rootViewController
    }
    
    private let rootViewController = UINavigationController()
    private let wishlistStepper: WishlistStepper
    private let services: AppServices
    
    init(services: AppServices, wishlistStepper: WishlistStepper) {
        self.wishlistStepper = wishlistStepper
        self.services = services
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MainStep else { return .none }
        
        switch step {
        case .moviesAreRequired:
            
        default:
            <#code#>
        }
    }
    
    private func navigateToMovieListScreen() -> FlowContributors {
        let viewController = WishlistViewController.instantiate()
    }
}
