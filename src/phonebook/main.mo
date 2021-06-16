// Import standard library functions for lists

import L "mo:base/List";
import A "mo:base/AssocList";
import Debug "mo:base/Debug";

// The PhoneBook actor.
actor {

    // Type aliases make the rest of the code easier to read.
    public type Name = Text;
    public type Phone = Text;

    // The actor maps names to phone numbers.
    flexible var book: A.AssocList<Name, Phone> = L.nil<(Name, Phone)>();
    Debug.print(book);

    // An auxiliary function checks whether two names are equal.
    func nameEq(l: Name, r: Name): Bool {
        return l == r;
    };

    // A shared invokable function that inserts a new entry
    // into the phone book or replaces the previous one.
    public func insert(name: Name, phone: Phone): async () {
        let (newBook, _) = A.replace<Name, Phone>(book, name, nameEq, ?phone);
        book := newBook;
    };

    // A shared read-only query function that returns the (optional)
    // phone number corresponding to the person with the given name.
    public query func lookup(name: Name): async ?Phone {
        return A.find<Name, Phone>(book, name, nameEq);
    };
};

// import Debug "mo:base/Debug";
// import List "mo:base/List";
// import AssocList "mo:base/AssocList";


// actor Foo {
  
//     public type Name = Text;
//     public type Phone = Text;

//     flexible var book: AssocList.AssocList<Name, Phone> = List.nil<(Name, Phone)>();
  
//     public func print(): async () {
//       Debug.print(debug_show(book))
//     };
  
//     func nameEq(l: Name, r: Name): Bool {
//         return l == r;
//     };
    
//     public query func lookup(name: Name): async ?Phone {
//         return AssocList.find<Name, Phone>(book, name, nameEq);
//     };
    
//     public func insert(name: Name, phone: Phone): async () {
//         let (newBook, _) = AssocList.replace<Name, Phone>(book, name, nameEq, ?phone); 
//         book := newBook;
//     };
// };

// await Foo.insert("tarek", "12345");
// await Foo.insert("tarek2", "4444");
// await Foo.print();