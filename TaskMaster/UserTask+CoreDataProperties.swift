import Foundation
import CoreData

extension UserTask {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserTask> {
        return NSFetchRequest<UserTask>(entityName: "UserTask")
    }

    @NSManaged public var title: String?
    @NSManaged public var dateCreated: Date?
}

extension UserTask : Identifiable {}
