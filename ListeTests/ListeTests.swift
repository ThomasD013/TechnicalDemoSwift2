//
//  ListeTests.swift
//  ListeTests
//
//  Created by Thomas on 04/01/2023.
//

import XCTest
@testable import Liste
import SnapshotTesting

class ListeTests: XCTestCase {
    func testListeViewController() {
        let preview = UserDetailViewControllerPreview.preview
        preview.view.backgroundColor = .white
        assertSnapshot(of: preview, as: .wait(for: 5, on: .image))
    }
}
