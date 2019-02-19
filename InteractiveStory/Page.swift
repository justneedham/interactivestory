//
// Created by Justin Needham on 2019-02-19.
// Copyright (c) 2019 ___jneedham___. All rights reserved.
//

import Foundation

class Page {
    let story: Story
    typealias Choice = (title: String, page: Page)
    var firstChoice: Choice?
    var secondChoice: Choice?

    init(story: Story) {
        self.story = story
    }
}

extension Page {

    func addChoiceWith(title: String, story: Story) -> Page {
        let page = Page(story: story)
        return addChoiceWith(title: title, page: page)
    }

    func addChoiceWith(title: String, page: Page) -> Page {
//        guard firstChoice != nil && secondChoice != nil else { return self }
//        if firstChoice == nil {
//            firstChoice = (title, page)
//        } else {
//            secondChoice = (title, page)
//        }
        switch (firstChoice, secondChoice) {
        case (.some, .some): return self
        case(.none, .none), (.none, .some): firstChoice = (title, page)
        case(.some, .none): secondChoice = (title,page)
        }
        return page
    }
}

struct Adventure {
    static var story: Page {
        let returnTrip = Page(story: .returnTrip)
        let touchDown = returnTrip.addChoiceWith(title: "Stop And Investigate", story: .touchDown)
        let homeward = returnTrip.addChoiceWith(title: "Continue On To Earth", story: .homeward)
        let rover = touchDown.addChoiceWith(title: "Explore The Rover", story: .rover)
        let crate = touchDown.addChoiceWith(title: "Open The Crate", story: .crate)
        homeward.addChoiceWith(title: "Head back to Mars", page: touchDown)
        let home = homeward.addChoiceWith(title: "Continue Home to Earth", story: .home)

        let cave = rover.addChoiceWith(title: "Explore the Coordinates", story: .cave)
        rover.addChoiceWith(title: "Return to Earth", page: home)

        cave.addChoiceWith(title: "Continue towards faint light", story: .droid)
        cave.addChoiceWith(title: "Refill the ship and explore the rover", page: rover)

        crate.addChoiceWith(title: "Explore the Rover", page: rover)
        crate.addChoiceWith(title: "Use the key", story: .monster)
        return returnTrip
    }
}
