//
//  AppFlow.swift
//  RxMovieCoordinator
//
//  Created by Sherif Kamal on 1/14/20.
//  Copyright © 2020 Sherif Kamal. All rights reserved.
//

import Foundation
import UIKit.UINavigationController
import RxFlow

class AppFlow: Flow {
    var root: Presentable {
        return rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        viewController.setNavigationBarHidden(true, animated: false)
        return viewController
    }()
    
    private let services: AppServices
    
    init(services: AppServices) {
        self.services = services
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MainStep else { return .none }
        switch step {
        case .dashboardIsRequired:
            return
        default:
            <#code#>
        }
    }
    
    private func navigationToDashboardScreen() -> FlowContributors {
        let dashboardFlow = 
    }
}

