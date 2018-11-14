//
//	RootClass.swift
//
//	Create by Ahmed Tawfik on 14/11/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct RootClass : Codable {

	let date : String?
	let tasks : [Task]?


	enum CodingKeys: String, CodingKey {
		case date = "date"
		case tasks = "tasks"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		tasks = try values.decodeIfPresent([Task].self, forKey: .tasks)
	}


}