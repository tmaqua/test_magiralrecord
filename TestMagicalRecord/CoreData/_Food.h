// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Food.h instead.

#import <CoreData/CoreData.h>


extern const struct FoodAttributes {
	__unsafe_unretained NSString *food_id;
	__unsafe_unretained NSString *food_type;
	__unsafe_unretained NSString *price;
} FoodAttributes;

extern const struct FoodRelationships {
	__unsafe_unretained NSString *eatlist;
} FoodRelationships;

extern const struct FoodFetchedProperties {
} FoodFetchedProperties;

@class EatList;





@interface FoodID : NSManagedObjectID {}
@end

@interface _Food : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (FoodID*)objectID;





@property (nonatomic, strong) NSNumber* food_id;



@property int16_t food_idValue;
- (int16_t)food_idValue;
- (void)setFood_idValue:(int16_t)value_;

//- (BOOL)validateFood_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* food_type;



@property int16_t food_typeValue;
- (int16_t)food_typeValue;
- (void)setFood_typeValue:(int16_t)value_;

//- (BOOL)validateFood_type:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* price;



@property int16_t priceValue;
- (int16_t)priceValue;
- (void)setPriceValue:(int16_t)value_;

//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) EatList *eatlist;

//- (BOOL)validateEatlist:(id*)value_ error:(NSError**)error_;





@end

@interface _Food (CoreDataGeneratedAccessors)

@end

@interface _Food (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveFood_id;
- (void)setPrimitiveFood_id:(NSNumber*)value;

- (int16_t)primitiveFood_idValue;
- (void)setPrimitiveFood_idValue:(int16_t)value_;




- (NSNumber*)primitiveFood_type;
- (void)setPrimitiveFood_type:(NSNumber*)value;

- (int16_t)primitiveFood_typeValue;
- (void)setPrimitiveFood_typeValue:(int16_t)value_;




- (NSNumber*)primitivePrice;
- (void)setPrimitivePrice:(NSNumber*)value;

- (int16_t)primitivePriceValue;
- (void)setPrimitivePriceValue:(int16_t)value_;





- (EatList*)primitiveEatlist;
- (void)setPrimitiveEatlist:(EatList*)value;


@end
