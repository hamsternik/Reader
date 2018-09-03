//
//  Reader.swift
//  Reader
//
//  Created by Nikita Khomitsevich on 9/3/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation


class Reader<T, U> {
    
    let runReader: (T) -> U
    init(runReader: @escaping (T) -> U) {
        self.runReader = runReader
    }
    
    class var ask: Reader<T, T> {
        return Reader<T, T> { (t: T) -> T in return t }
    }
    
    func local<R>(f: @escaping (R) -> T) -> Reader<R, U> {
        return Reader<R, U> { [unowned self] (r: R) -> U in return self.runReader(f(r)) }
    }
    
}
