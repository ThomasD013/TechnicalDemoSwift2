//
//  UserDetailViewController.swift
//  Liste
//
//  Created by Thomas Dutartre on 06/01/2024.
//

import UIKit
import Combine
import MapKit
import SwiftUI

final class UserDetailViewController: ViewController<UserDetailViewModel> {

    private let mainScrollView: UIScrollView = .init()
    private let mainStackView: UIStackView = .init()
    private var cancellables: Set<AnyCancellable> = []

    private let imageView: UIImageView = .init()
    private let genderLabel: UILabel = .init()
    private let firstNameLabel: UILabel = .init()
    private let lastNameLabel: UILabel = .init()
    private let addressLabel: UILabel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()

        setBindings()
        setupStackView()
        setupLabels()
    }

    func setBindings() {
        viewModel
            .$user
            .receive(on: RunLoop.main)
            .compactMap({ $0 })
            .sink(receiveValue: { [weak self] value in
                guard let self else { return }

                imageView.load(url: URL(string: value.picture.large))
                genderLabel.text = Strings.User.title(value.name.title)
                firstNameLabel.text = Strings.User.firstName(value.name.first)
                lastNameLabel.text = Strings.User.lastName(value.name.last)
                let address: String =
                    """
                    \(value.location.street.number) \(value.location.street.name)
                    \(value.location.postcode) \(value.location.city)
                    \(value.location.state) \(value.location.country)
                    """
                addressLabel.text = address
                addressLabel.underline()
            })
            .store(in: &cancellables)
    }

    func setupStackView() {
        self.view.addSubviewAndFit(mainScrollView)
        mainStackView.axis = .vertical
        mainScrollView.addSubview(mainStackView)

        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor, constant: -16).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -32).isActive = true
    }

    private func setupLabels() {
        mainStackView.addArrangerSubViews(subViews: [
            UIView.spacer(height: 32),
            getImageView(),
            UIView.spacer(height: 32),
            genderLabel,
            UIView.spacer(height: 16),
            firstNameLabel,
            UIView.spacer(height: 16),
            lastNameLabel,
            UIView.spacer(height: 16),
            getAddressLabel()
        ])
    }

    private func getAddressLabel() -> UIStackView {
        let addressContainer: UIStackView = .init()
        let addressLabelName: UILabel = .init()
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.mapLinkLabelTapped(_:)))

        addressLabelName.text = Strings.User.location
        addressContainer.axis = .horizontal
        addressContainer.alignment = .leading

        addressLabel.isUserInteractionEnabled = true
        addressLabel.addGestureRecognizer(labelTap)
        addressLabel.numberOfLines = 0

        addressContainer.addArrangerSubViews(subViews: [
            addressLabelName, addressLabel
        ])

        return addressContainer
    }

    @objc private func mapLinkLabelTapped(_ sender: UITapGestureRecognizer) {
        guard let user = viewModel.user,
              let url = URL(string: "maps://?q=Title&ll=\(user.location.coordinates.latitude),\(user.location.coordinates.longitude)")
        else { return }

        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }

    private func getImageView() -> UIView {
        let container: UIView = .init()
        container.addSubview(imageView)
        container.heightAnchor.constraint(equalToConstant: 128).isActive = true
        imageView.anchorCenter()
        return container
    }
}

#Preview {
    return UserDetailViewControllerPreview.preview
}

struct UserDetailViewControllerPreview {
    static var preview: UserDetailViewController {
        let controller = UserDetailViewController()
        let user = User(
            gender: .male,
            name: .init(title: "M", first: "Thierry", last: "Henry"),
            location: .init(
                street: .init(number: 50, name: "rue de la republique"),
                city: "Lyon",
                state: "Rhone",
                country: "France",
                postcode: .integer(79100),
                coordinates: .init(
                    latitude: "50",
                    longitude: "60"
                ),
                timezone: .init(
                    offset: "",
                    description: ""
                )
            ),
            email: "thomas@gmail.com",
            login: .init(
                uuid: "",
                username: "username",
                password: "",
                salt: "",
                md5: "",
                sha1: "",
                sha256: ""
            ),
            dob: .init(
                date: "",
                age: 10
            ),
            registered: .init(date: "", age: 0),
            phone: "",
            cell: "",
            id: .init(
                name: "",
                value: ""
            ),
            picture: .init(
                large: "https://randomuser.me/api/portraits/men/91.jpg",
                medium: "https://randomuser.me/api/portraits/men/91.jpg",
                thumbnail: "https://randomuser.me/api/portraits/men/91.jpg"
            ),
            nat: "FR"
        )
        controller.viewModel = UserDetailViewModel(user: user)
        return controller
    }
}
