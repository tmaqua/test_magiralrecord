#import "_Person.h"
#import "CoreData+MagicalRecord.h"

@interface Person : _Person {}
// Custom logic goes here.

+ (Person*)createPerson:(NSString*)name age:(NSNumber*)age;
+ (NSArray*)findAll;
+ (NSArray*)findOverAgePerson:(NSNumber*)age;
+ (NSArray*)findUnderAgePerson:(NSNumber*)age;
@end
