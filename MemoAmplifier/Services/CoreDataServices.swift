//
//  CoreDataServices.swift
//  MemoAmplifier
//
//  Created by Paull Stanley on 8/17/22.
//
import CoreData
import Foundation

protocol CoreDataStack {
    var writerContext: NSManagedObjectContext { get }
    var readerContext: NSManagedObjectContext { get }
    
    func save(_ completion: @escaping () -> ())
    func insertEmployee(employeeModel: EmployeeModel)
    func insertMessageUseCase(useCaseKey: String, useCaseValue: String)
}

final class CoreDataServices: CoreDataStack, ObservableObject {
    static let store = CoreDataServices()
    private let persistentContainer = try! startPersistentContainer()
    
    @Published var savedEmployees: [EmployeeMO] = []
    @Published var savedMessageUseCases: [MessageUseCaseMO] = []
    
    private init() {
        self.saveEmployees()
        self.saveMessageUseCases()
        self.saveChanges()
        
        self.fetchEmployeess()
        self.fetchAllMessageUseCases()
    }
    
    public private(set) lazy var readerContext: NSManagedObjectContext = {
        // Initialize Managed Object Context
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        // Configure Managed Object Context
        managedObjectContext.parent = self.writerContext
        
        return managedObjectContext
    }()
    
    private(set) lazy var writerContext: NSManagedObjectContext = {
        // Initialize Managed Object Context
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        
        // Configure Managed Object Context
        managedObjectContext.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        
        return managedObjectContext
    }()
    
    private func saveMessageUseCases() {
            let results = DefaultTextComponents.allMessageComponents
            for (key, value) in results {
                self.insertMessageUseCase(useCaseKey: key, useCaseValue: value)
            }
    }
    
    private func saveEmployees() {
        //  if(!GlobalConstants.isToolIdUpToDate || !GlobalConstants.doesDBDirectoryExist)  {
            do {
                let data = try String(contentsOfFile: AppState.shared.REQUIRED_CSV_PATH)
                let results = try GlobalConstants.csvConfig.decode([EmployeeModel].self, from: data)
                
                for model in results {
                    self.insertEmployee(employeeModel: model)
                }
                AppState.shared.TOOL_ID_LAST_IMPORT_DATE = Date()
                print("New Set of employees was loaded into the store")
            } catch {
                print("Unable to save the toolID to Core Data")
            }
       // } //else if (GlobalConstants.isToolIdUpToDate) {
        // return
        // }
    }
    private func fetchAllMessageUseCases() {
        let request = NSFetchRequest<MessageUseCaseMO>(entityName: "MessageUseCaseEntity")
        do {
            savedMessageUseCases = try readerContext.fetch(request)
        } catch {
            print("Error fetching MessageComponentsMO Entities. \(error)")
        }
        
       // return try await readerContext.get(request: MessageComponentsMO.fetchRequest())
    }
    
    private func fetchEmployeess() {
        let request = NSFetchRequest<EmployeeMO>(entityName: "EmployeeEntity")
        do {
            savedEmployees = try readerContext.fetch(request)
        } catch {
            print("Error fetching EmployeeMO Entities. \(error)")
        }
        // try readerContext.fetch(EmployeeMO.fetchRequest())
        //return try await readerContext.get(request: EmployeeMO.fetchRequest())
    }
    
    
    private func saveChanges() {
        readerContext.performAndWait {
            do {
                if self.readerContext.hasChanges {
                    try self.readerContext.save()
                }
            } catch {
                print("Unable to Save Changes of Main Managed Object Context")
                print("\(error), \(error.localizedDescription)")
            }
        }
        writerContext.perform {
            do {
                if self.writerContext.hasChanges {
                    try self.writerContext.save()
                }
            } catch {
                print("Unable to Save Changes of Private Managed Object Context")
                print("\(error), \(error.localizedDescription)")
            }
        }
    }
}

extension CoreDataStack {
    func insertEmployee(employeeModel: EmployeeModel) {
        writerContext.perform {
            let obj = EmployeeMO.findOrInsert(using: employeeModel, in: writerContext)
            //NSEntityDescription.insertNewObject(forEntityName: "EmployeeEntity", into: self.writerContext)
            obj.setValue(employeeModel.id, forKey: "id")
            obj.setValue(employeeModel.name, forKey: "name")
            obj.setValue(employeeModel.emailAddress, forKey: "email_address")
            obj.setValue(employeeModel.slackURL, forKey: "slack_url")
            obj.setValue(employeeModel.siteLocation, forKey: "employee_site")
            obj.setValue(employeeModel.jobRole, forKey: "schedule")
            obj.setValue(employeeModel.schedule, forKey: "employee_schedule")
        }
    }
    
    func insertMessageUseCase(useCaseKey: String, useCaseValue: String) {
        writerContext.perform {
            let obj = MessageUseCaseMO.findOrInsert(using: useCaseKey, and: useCaseValue, in: writerContext)
            obj.setValue(useCaseKey, forKey: "key")
            obj.setValue(useCaseValue, forKey: "value")
        }
    }
    
    func fetchEmployeeCount(result: @escaping (Int) -> ()) {
        self.readerContext.perform {
            let request = NSFetchRequest<NSManagedObject>(entityName: "EmployeeEntity")
            let count = (try? readerContext.count(for: request)) ?? 0
            result(count)
        }
    }
    
    func fetchFirstFewEmployeess(result: @escaping ([String]) -> ()) {
        self.readerContext.perform {
            let request = NSFetchRequest<NSManagedObject>(entityName: "EmployeeEntity")
            request.fetchLimit = 5
            
            let fetchResult = (try? readerContext.fetch(request)) ?? [NSManagedObject]()
            let content = fetchResult.compactMap { obj in
                obj.value(forKey: "tool_id") as? String
            }
            result(content)
        }
    }
    
    func save(_ completion: @escaping () -> ()) {
        writerContext.perform {
            self.writerContext.saveIfNeeded()
            completion()
        }
    }
}

func startPersistentContainer() throws-> NSPersistentContainer {
    let container = NSPersistentContainer(name: "MemoAmplifier")
   
    container.loadPersistentStores { description, error in
        if let error = error {
            fatalError(error.localizedDescription)
        }
    }
    return container
}
