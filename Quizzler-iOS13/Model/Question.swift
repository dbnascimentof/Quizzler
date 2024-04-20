//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Daniel Filho on 19/04/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var title: String
    var answer: String
    var isAnswered: Bool
    
    init(title: String, answer: String, isAnswered: Bool) {
        self.title = title
        self.answer = answer
        self.isAnswered = isAnswered
    }
}
