//
//  AppServices.swift
//  RxMovieCoordinator
//
//  Created by Sherif Kamal on 1/14/20.
//  Copyright © 2020 Sherif Kamal. All rights reserved.
//

import Foundation

struct AppServices: HasMoviesService, HasPreferencesService {
    let moviesService: MoviesService
    let preferencesService: PreferencesService
}
