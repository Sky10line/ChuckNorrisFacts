//
//  ChuckRequest.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import Foundation
import Moya

enum ChuckRequest {
	case getRandomJoke
	case getListOfCategories
	case search(text: String)
}

extension ChuckRequest: TargetType {
	var baseURL: URL { return URL(string: "https://api.chucknorris.io/jokes")! }
	
	var path: String {
		switch self {
		case .getRandomJoke:
			return "/random"
		case .getListOfCategories:
			return "/categories"
		case .search(_):
			return "/search"
		}
	}
	
	var method: Moya.Method {
		switch self {
		case .getListOfCategories, .getRandomJoke, .search:
			return .get
		}
	}
	
	var sampleData: Data {
		return Data()
	}
	
	var task: Task {
		switch self {
		case .getListOfCategories, .getRandomJoke:
			return .requestPlain
		case .search(text: let text):
			return .requestParameters(parameters: ["query" : text], encoding: URLEncoding.queryString)
		}
	}
	
	var headers: [String : String]? {
		return ["Content-type" : "application/json"]
	}
}
