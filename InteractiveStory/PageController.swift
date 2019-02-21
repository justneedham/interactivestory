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
        view.backgroundColor = .blue
        if let page = page {
            print(page.story.text)
        }
    }
}
