//
//  Request.swift
//  iOSTechnicalTest
//
//  Created by Emmanuel Valentín Granados López on 5/19/19.
//  Copyright © 2019 Emmanuel Valentín Granados López. All rights reserved.
//

import Foundation
import Alamofire

class Request {
    static let sharedInstance = Request()
    
    func performAsync(onSuccess: @escaping (Any) -> Void,
                      onFailure: @escaping (_ error: String) -> Void) {
        Alamofire.request("https://api.themoviedb.org/4/list/1",
                          method: .get,
                          headers: getHeaders())
            .responseJSON { (response) in
                switch response.result {
                case .success(let jsonResponse):
                    onSuccess(jsonResponse)
                case .failure(let error):
                    onFailure("\(error)")
                }
        }
    }
    
    func getHeaders() -> HTTPHeaders {
        var unAuthHeaders: HTTPHeaders = ["Content-Type": "application/json;charset=utf-8"]
        
        unAuthHeaders["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMzI5YjEwNDA0NDM3MmJlYzJhOWVjMmIzNTg1NDQ5YSIsInN1YiI6IjVjZTE4OTY1OTI1MTQxM2U2NWI4MjljNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WEnlY7XEv5MbmjBsRxtChPqZ2qp4vywD-5EfJNghTo0"
        
        return unAuthHeaders
    }
    
}
