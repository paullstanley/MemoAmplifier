//
//  EmployeeMO+CoreDataProperties.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 8/17/22.
//
//

import Foundation
import CoreData


extension EmployeeMO {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeMO> {
        return NSFetchRequest<EmployeeMO>(entityName: "EmployeeEntity")
    }
    @NSManaged public var id: Int
    @NSManaged public var name: String?
    @NSManaged public var email_address: String?
    @NSManaged public var slack_url: String?
    @NSManaged public var schedule: String?
    @NSManaged public var site_location: String?
    @NSManaged public var job_role: String?
}

extension EmployeeMO : Identifiable { }

extension EmployeeMO {
    //Variables that do not require unwrapping so that we get back the expected type.
    public var unwrappedEmployeeName: String { name ?? "" }
    public var unwrappedEmployeeEmail: String { email_address ?? "" }
    public var unwrappedEmployeeSlack: String { slack_url ?? "" }
    public var unwrappedEmployeeSchedule: String { schedule ?? "" }
    public var unwrappedEmployeeSite: String { site_location ?? "" }
    public var unwrappedEmployeeRole: String { job_role ?? "" }
}

extension EmployeeMO {
    //Convenience function to convert CoreData Entity into thread safe struture
    func toDomainModel() -> EmployeeModel
    {
        return EmployeeModel(id: id,
                            name: unwrappedEmployeeName,
                            emailAddress: unwrappedEmployeeEmail,
                            slackURL: unwrappedEmployeeSlack,
                            schedule: unwrappedEmployeeSchedule,
                            siteLocation: unwrappedEmployeeSite,
                            jobRole: unwrappedEmployeeRole)
    }
}
extension EmployeeMO {
    static func findOrInsert(using model: EmployeeModel,
                             in context:NSManagedObjectContext)-> EmployeeMO
    {
        let request = NSFetchRequest<EmployeeMO>(entityName: "EmployeeEntity")
        request.predicate = NSPredicate(format: "%K == %@", #keyPath(EmployeeMO.name), model.name)
        request.fetchLimit = 1
        
        if let result = try? context.fetch(request),
           let employee = result.first
        {
            return employee
        }
        
        let employee = EmployeeMO(context: context)
        employee.id = model.id
        employee.name = model.name
        employee.email_address = model.emailAddress
        employee.slack_url = model.slackURL
        employee.schedule = model.schedule
        employee.site_location = model.siteLocation
        employee.job_role = model.jobRole
        return employee
    }
}
