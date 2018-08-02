//
//  MZDownloadingArray.swift
//  MZDownloadManager
//
//  Created by thunderbirds66 on 2018/08/02.
//

import UIKit

open class MZDownloadingArray: NSObject {

	public var count: Int {
		get {
			var _count: Int = 0
			DBG("Wait arraySync")
			arraySync.lock()
			DBG("Locked arraySync")
			_count = self.array.count
			arraySync.unlock()
			DBG("Unlocked arraySync")
			return _count
		}
	}

	private var array: [MZDownloadModel] = []
	private let arraySync: NSRecursiveLock = NSRecursiveLock()

	override init() {
	}

	open func append(_ model: MZDownloadModel) {
		DBG("Wait arraySync")
		arraySync.lock()
		DBG("Locked arraySync")
		array.append(model)
		arraySync.unlock()
		DBG("Unlocked arraySync")
	}

	open func remove(at index: Int) {
		DBG("Wait arraySync")
		arraySync.lock()
		DBG("Locked arraySync")
		array.remove(at: index)
		arraySync.unlock()
		DBG("Unlocked arraySync")
	}

	open func get(at index: Int) -> MZDownloadModel {
		var model: MZDownloadModel
		DBG("Wait arraySync")
		arraySync.lock()
		DBG("Locked arraySync")
		model = array[index]
		arraySync.unlock()
		DBG("Unlocked arraySync")
		return model
	}

	open func set(at index: Int, _ model: MZDownloadModel) {
		DBG("Wait arraySync")
		arraySync.lock()
		DBG("Locked arraySync")
		array[index] = model
		arraySync.unlock()
		DBG("Unlocked arraySync")
	}
}
