//
//  TextViewModel.swift
//  SampleMVVM
//
//  Created by Krzysztof Kunowski on 05/01/15.
//  Copyright (c) 2015 kkunowski. All rights reserved.
//

import UIKit

extension String {
    func reversedString() -> String  {
        var result = ""
        result.extend(reverse(self))
        return result
    }
}

class TextViewModel: NSObject {
   
    var stringText : String!
    var reversedStringText: String!
    var reversedTextStringSingal: RACSignal!
 
    override init(){
        super.init()
        reversedTextStringSingal = RACObserve(self, "stringText").map { (object) -> AnyObject! in let string = object as String
            return string.reversedString()
            }.distinctUntilChanged()
    }
}
