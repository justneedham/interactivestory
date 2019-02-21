//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Justin Needham on 2019-02-18.
//  Copyright © 2019 ___jneedham___. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure" {
            guard let pageController = segue.destination as? PageController else { return }
            pageController.page = Adventure.story
        }
    }
}
