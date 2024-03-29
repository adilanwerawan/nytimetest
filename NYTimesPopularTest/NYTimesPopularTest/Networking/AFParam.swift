//
//  AFPram.swift
//  RestaurantsApp
//
//  Created by Adil Anwer on 5/18/18.
//  Copyright © 2018 Adil Anwer. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

//request param for call
public struct AFParam {
    
    var endpoint: String = ""
    var params: [String : AnyObject]?
    var headers: [String : String]?
    var method: HTTPMethod
    var images: [UIImage]?
    var parameterEncoding: ParameterEncoding
    
    public init(endpoint:String, params: [String : AnyObject]?, headers: [String : String], method: HTTPMethod, parameterEncoding: ParameterEncoding, images: [UIImage]) {
        self.endpoint = endpoint
        self.params = params
        self.headers = headers
        self.method = method
        self.images = images
        self.parameterEncoding = parameterEncoding
    }
}
