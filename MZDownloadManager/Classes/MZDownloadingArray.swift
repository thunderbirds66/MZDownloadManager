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

    open func remove(model modelToRemove: MZDownloadModel) {
        var model: MZDownloadModel
        var found: Int = -1
        DBG("Wait arraySync")
        arraySync.lock()
        DBG("Locked arraySync")
        for index in 0..<self.array.count {
            model = array[index] as MZDownloadModel
            guard let task: URLSessionDownloadTask = model.task else {
                continue
            }
            if task.isEqual(modelToRemove.task) {
                found = index
                break
            }
        }
        if found != -1 {
            self.array.remove(at: found)
        }
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

    open func update(_ newModel: MZDownloadModel) {
        var model: MZDownloadModel
        var found: Int = -1
        DBG("Wait arraySync")
        arraySync.lock()
        DBG("Locked arraySync")
        for index in 0..<self.array.count {
            model = array[index] as MZDownloadModel
            guard let task: URLSessionDownloadTask = model.task else {
                continue
            }
            if task.isEqual(newModel.task) {
                found = index
                break
            }
        }
        if found != -1 {
            self.array[found] = newModel
        }
        arraySync.unlock()
        DBG("Unlocked arraySync")
    }

    open func find(_ downloadTask: URLSessionDownloadTask) -> MZDownloadModel? {
        var model: MZDownloadModel
        var found: MZDownloadModel?
        DBG("Wait arraySync")
        arraySync.lock()
        DBG("Locked arraySync")
        for index in 0..<self.array.count {
            model = array[index] as MZDownloadModel
            guard let task: URLSessionDownloadTask = model.task else {
                continue
            }
            if task.isEqual(downloadTask) {
                found = model
                break
            }
        }
        arraySync.unlock()
        DBG("Unlocked arraySync")
        return found
    }

    open func indexOf(_ modelToFind: MZDownloadModel) -> Int {
        guard let taskToFind: URLSessionDownloadTask = modelToFind.task else {
            DBG("task not set")
            return -1
        }
        var model: MZDownloadModel
        DBG("Wait arraySync")
        arraySync.lock()
        DBG("Locked arraySync")
        for index in 0..<self.array.count {
            model = array[index] as MZDownloadModel
            guard let task: URLSessionDownloadTask = model.task else {
                continue
            }
            if task.isEqual(taskToFind) {
                return index
            }
        }
        arraySync.unlock()
        DBG("Unlocked arraySync")
        return -1
    }
}
