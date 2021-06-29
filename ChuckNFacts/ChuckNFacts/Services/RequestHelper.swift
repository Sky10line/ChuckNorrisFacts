//
//  RequestHelper.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import UIKit
import Moya

class RequestHelper {
	
	var provider = MoyaProvider<ChuckRequest>()
	
	func createSearchRequest(text: String, result: @escaping (Result<chuckSearch, MoyaError>) -> ()) {
		provider.request(.search(text: text)) { (res) in
			switch res {
			case .success(let response):
				let json = try! JSONDecoder().decode(chuckSearch.self, from: response.data)
				result(.success(json))
				
			case .failure(let error):
				result(.failure(error))
			}
		}
	}
}
