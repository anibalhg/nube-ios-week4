import Foundation
import CoreData

@objc(LibroData)
class LibroData: NSManagedObject{
    
    @NSManaged var isbn: String?
    @NSManaged var titulo: String?
    @NSManaged var autores: String?
    @NSManaged var imagen: String?
    
    func set(libro: Libro) {
        self.isbn = libro.isbn
        self.titulo = libro.titulo
        self.autores = libro.autores
        self.imagen = libro.imagen
    }
    
    func convert() -> Libro {
        let libro = Libro()
        libro.isbn = self.isbn
        libro.titulo = self.titulo
        libro.autores = self.autores
        libro.imagen = self.imagen
        
        return libro
    }
    
    
    
    class func convert(data: [LibroData]) -> [Libro] {
        var libros = [Libro]()
        for l in data {
            let libro = l.convert()
            libros.append(libro)
        }
        
        return libros
    }
    
}