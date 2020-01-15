//
//  ViewModelBased.swift
//  RxMovieCoordinator
//
//  Created by Sherif Kamal on 1/14/20.
//  Copyright © 2020 Sherif Kamal. All rights reserved.
//

import UIKit
import Reusable

protocol ViewModel {
    
}

protocol ServiceViewModel: ViewModel {
    associatedtype ServiceType
    var services: ServiceType! { get set }
}

protocol ViewModelBased: class {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}

extension ViewModelBased where Self: StoryboardBased & UIViewController {
    static func instantiate<ViewModelType>(withViewModel viewModel: ViewModelType) -> Self where ViewModelType == Self.ViewModelType {
        let viewController = self.instantiate()
        viewController.viewModel = viewModel
        return viewController
    }
}

extension ViewModelBased where Self: StoryboardBased & UIViewController, ViewModelType: ServiceViewModel {
    static func instantiate<ViewModelType, ServicesType>(withViewModel viewModel: ViewModelType, andServices services: ServicesType) -> Self where ViewModelType == Self.ViewModelType, ServicesType == Self.ViewModelType.ServiceType {
        let viewController = self.instantiate()
        viewController.viewModel = viewModel
        viewController.viewModel.services = services
    }
}
