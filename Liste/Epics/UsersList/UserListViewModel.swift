//
//  UserListViewModel.swift
//  Liste
//
//  Created by Thomas Dutartre on 05/01/2024.
//

import Foundation

class UserListViewModel: ViewModel<UserListViewModel.Dependencies> {

    @Published var users: [User] = []
    let title: String = Strings.Users.title
    let usersCountLimit: Int = 20

    public func getUsers() async {
        do {
            let parameters: GetUsersServiceParameters = .init(amount: 10)
            let newUsers: Welcome = try await inputs.getUsersService.call(with: parameters)
            users += newUsers.results
        } catch {
            print(error)
        }
    }

    public func refresh() async {
        users.removeAll()
        await self.getUsers()
    }
}

extension UserListViewModel {
    struct Dependencies {
        let getUsersService: GetUsersServicing
    }
}
