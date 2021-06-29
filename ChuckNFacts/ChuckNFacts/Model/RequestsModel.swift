//
//  RequestsModel.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import Foundation
import Moya

struct chuckSearch : Decodable {
	var total: Int?
	var result: [chuckResponse]?
	var violations: [String: String]?
}

struct chuckResponse : Decodable {
	var categories: [String]?
	var value: String
	var created_at: String
	var url: String
}
