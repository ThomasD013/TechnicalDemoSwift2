//
//  Test.swift
//  Liste
//
//  Created by Thomas Dutartre on 05/01/2024.
//

import UIKit
import Combine

final class UserListViewController: ViewController<UserListViewModel> {

    private var lastIndex = -1
    private let refreshControl: UIRefreshControl = .init()
    private var cancellables: Set<AnyCancellable> = []

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        setupRefreshControl()
        setBindings()
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.frame = view.bounds
        tabBarController?.tabBar.isHidden = false
    }

    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.title = viewModel.title
    }

    func setBindings() {
        viewModel
            .$users
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] _ in
                guard let self else { return }

                updateTableView()
            })
            .store(in: &cancellables)
    }

    private func setupRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: Strings.Users.pullToRefresh)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    private func fetchUsers() {
        Task {
            await viewModel.getUsers()
        }
    }

    @objc func refresh(_ sender: Any) {
        Task {
            await viewModel.refresh()
        }
    }

    private func updateTableView() {
        let firstIndex: Int = lastIndex + 1
        if firstIndex > viewModel.users.count - 1 {
            fetchUsers()
            return
        }

        lastIndex = (lastIndex + viewModel.usersCountLimit) <= (viewModel.users.count - 1)
        ? (lastIndex + viewModel.usersCountLimit)
        : (viewModel.users.count - 1)
        refreshControl.endRefreshing()
        self.tableView.reloadData()
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        if let user = viewModel.users[safe: indexPath.row] {
            cell.textLabel?.text = "\(user.name.first) \(user.name.last)"
        }
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row >= lastIndex {
            updateTableView()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let user: User = viewModel.users[safe: indexPath.row] else { return }

        let controller: UserDetailViewController = ViewControllerProvider.Consumer.detail(user: user)
        navigationController?.pushViewController(controller, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
