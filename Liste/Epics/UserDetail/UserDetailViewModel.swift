//
//  UserDetailViewModel.swift
//  Liste
//
//  Created by Thomas Dutartre on 06/01/2024.
//

import Combine

final class UserDetailViewModel: ViewModel<Void> {
    @Published var user: User?

    init(user: User? = nil) {
        self.user = user
        super.init(inputs: ())
    }

    func setup(user: User) {
        self.user = user
    }
}
