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
