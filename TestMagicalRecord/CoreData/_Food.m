// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Food.m instead.

#import "_Food.h"

const struct FoodAttributes FoodAttributes = {
	.food_id = @"food_id",
	.food_type = @"food_type",
	.price = @"price",
};

const struct FoodRelationships FoodRelationships = {
	.eatlist = @"eatlist",
};

const struct FoodFetchedProperties FoodFetchedProperties = {
};

@implementation FoodID
@end

@implementation _Food

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Food";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Food" inManagedObjectContext:moc_];
}

- (FoodID*)objectID {
	return (FoodID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"food_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"food_id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"food_typeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"food_type"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"priceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"price"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic food_id;



- (int16_t)food_idValue {
	NSNumber *result = [self food_id];
	return [result shortValue];
}

- (void)setFood_idValue:(int16_t)value_ {
	[self setFood_id:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveFood_idValue {
	NSNumber *result = [self primitiveFood_id];
	return [result shortValue];
}

- (void)setPrimitiveFood_idValue:(int16_t)value_ {
	[self setPrimitiveFood_id:[NSNumber numberWithShort:value_]];
}





@dynamic food_type;



- (int16_t)food_typeValue {
	NSNumber *result = [self food_type];
	return [result shortValue];
}

- (void)setFood_typeValue:(int16_t)value_ {
	[self setFood_type:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveFood_typeValue {
	NSNumber *result = [self primitiveFood_type];
	return [result shortValue];
}

- (void)setPrimitiveFood_typeValue:(int16_t)value_ {
	[self setPrimitiveFood_type:[NSNumber numberWithShort:value_]];
}





@dynamic price;



- (int16_t)priceValue {
	NSNumber *result = [self price];
	return [result shortValue];
}

- (void)setPriceValue:(int16_t)value_ {
	[self setPrice:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePriceValue {
	NSNumber *result = [self primitivePrice];
	return [result shortValue];
}

- (void)setPrimitivePriceValue:(int16_t)value_ {
	[self setPrimitivePrice:[NSNumber numberWithShort:value_]];
}





@dynamic eatlist;

	






@end
