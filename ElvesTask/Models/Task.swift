//
//	Task.swift
//
//	Create by Ahmed Tawfik on 14/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Task : Codable {

	let body : String?
	let completed : Bool?
	let id : Int?
	let imgUrl : String?
	let title : String?


	enum CodingKeys: String, CodingKey {
		case body = "body"
		case completed = "completed"
		case id = "id"
		case imgUrl = "img_url"
		case title = "title"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		body = try values.decodeIfPresent(String.self, forKey: .body)
		completed = try values.decodeIfPresent(Bool.self, forKey: .completed)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		imgUrl = try values.decodeIfPresent(String.self, forKey: .imgUrl)
		title = try values.decodeIfPresent(String.self, forKey: .title)
	}


}