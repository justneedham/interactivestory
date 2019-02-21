//
//  PageController.swift
//  InteractiveStory
//
//  Created by Justin Needham on 2019-02-20.
//  Copyright © 2019 ___jneedham___. All rights reserved.
//

import UIKit

class PageController: UIViewController {

    var page: Page?

    // MARK: - User Interface Properties
    let artworkView = UIImageView()
    let storyLabel = UILabel()
    let firstChoiceButton = UIButton(type: .system)
    let secondChoiceButton = UIButton(type: .system)

    required init?(coder adDecoder: NSCoder) {
        super.init(coder: adDecoder)
    }

    init(page: Page) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let page = page {
            artworkView.image = page.story.artwork
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        view.addSubview(artworkView)
        artworkView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            artworkView.topAnchor.constraint(equalTo: view.topAnchor),
            artworkView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            artworkView.rightAnchor.constraint(equalTo: view.rightAnchor),
            artworkView.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
    }
}
