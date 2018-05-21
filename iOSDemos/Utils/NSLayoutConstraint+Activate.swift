//
//  NSLayoutConstraint+Activate.swift
//  ProgrammaticAutolayout
//
//  Created by Doug Diego on 2/4/17.
//  Copyright © 2017 Doug Diego. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    @discardableResult func activate() -> NSLayoutConstraint {
        isActive = true
        return self
    }
}
