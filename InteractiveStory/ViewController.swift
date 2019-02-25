//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Justin Needham on 2019-02-18.
//  Copyright © 2019 ___jneedham___. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var namTextField: UITextField!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure" {
            
            do {
                if let name = namTextField.text {
                    if name == "" {
                        throw AdventureError.nameNotProvided
                    } else {
                        guard let pageController = segue.destination as? PageController else { return }
                        pageController.page = Adventure.story(withName: "Justin")
                    }
                }
            } catch AdventureError.nameNotProvided {
                let alertController = UIAlertController(
                    title: "Name Not Provided",
                    message: "Provide a name to start the story!",
                    preferredStyle: .alert
                )
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                
                present(alertController, animated: true, completion: nil)
            } catch let error {
                fatalError("\(error.localizedDescription)")
            }
        }
    }
}
