#import "Person.h"


@interface Person ()

// Private interface goes here.

@end


@implementation Person

+ (Person*)createPerson:(NSString*)name age:(NSNumber*)age{
    Person *newPerson = [Person MR_createEntity];
    newPerson.name = name;
    newPerson.age = age;
    
    return newPerson;
}

+ (NSArray*)findAll{
    return [Person MR_findAll];
}

+ (NSArray*)findOverAgePerson:(NSNumber*)age{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age => %@", age];
    return [Person MR_findAllWithPredicate:predicate];
}

+ (NSArray*)findUnderAgePerson:(NSNumber*)age{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age =< %@", age];
    return [Person MR_findAllWithPredicate:predicate];
}

@end
