import UIKit
import CoreData

class LibroDao {
    
    var managedContext: NSManagedObjectContext!
    
    init() {
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.managedContext = delegate.managedObjectContext
    }
    
    func save(libro: Libro) -> Libro {
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Libro", inManagedObjectContext: managedContext) as! LibroData
        entity.set(libro)
        
        do {
            try managedContext.save()
            return libro
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
    }
    
    func findAll() -> [Libro] {
        let fetchRequest = NSFetchRequest(entityName: "Libro")
        let sort = NSSortDescriptor(key: "titulo", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            let data = try managedContext.executeFetchRequest(fetchRequest) as! [LibroData]
            let libros = LibroData.convert(data)
            return libros;
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
}
