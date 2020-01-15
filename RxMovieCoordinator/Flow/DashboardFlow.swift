//
//  DashboardFlow.swift
//  RxMovieCoordinator
//
//  Created by Sherif Kamal on 1/14/20.
//  Copyright © 2020 Sherif Kamal. All rights reserved.
//

import UIKit
import RxFlow
import RxCocoa
import RxSwift


class DashboardFlow: Flow {
    var root: UIViewController {
        return rootViewController
    }
    
    let rootViewController = UITabBarController()
    private let services: AppServices
    
    init(services: AppServices) {
        self.services = services
        self.wishlistStepper = wishlistStepper
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MainStep else { return .none }
        switch step {
        case .dashboardIsRequired:
            return navigationToDashboard()
        default:
            <#code#>
        }
    }
    
    private func navigationToDashboard() -> FlowContributors {
        let wishlistStepper = WishlistStepper()
        
        let wishListFlow = 
    }
}

class WishlistStepper: Stepper {
    let steps = PublishRelay<Step>()
    
    @objc func settingsAreRequired() {
        self.steps.accept(MainStep.settingsAreRequired)
    }
}
