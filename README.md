# Location Trivia Objects

## Objectives

1. Create custom class files.
2. Create, access, and set properties.
3. Compose initializers.
4. Write methods that interact with data stored in the instances of a custom class.

## Instructions

In the last *Location Trivia* lab you dealt with a representation of locations using `NSDictionary`. Now, increase the power of your programming by storing this information in custom classes instead!

*  Open the `locationTrivia-objects.xcworkspace` file.

### I. Create the Custom Classes

Create the class files for `FISLocation` that inherits from `NSObject`. This class should have four properties:

  * an `NSString` called `name`,
  * a `CGFloat` called `latitude`,
  * a `CGFloat` called `longitude`, and
  * an `NSMutableArray` called `trivia`.

Create the class files for `FISTrivium` that inherits from `NSObject`. This class should have two properties:

  * an `NSString` called `content`, and
  * an `NSUInteger` called `likes`.

On the `FISAppDelegate` class add a public property:

  * an `NSMutableArray` called `locations`.

### II. Declare Methods and Define Initial Implementations

On the `FISAppDelegate` class, declare three methods:

  * `allLocationNames` that takes no arguments and returns an `NSArray`,
  * `locationWithName:` that takes one `NSString` argument called `name` and returns a `FISLocation` object, and
  * `locationsNearLatitude:longitude:margin:` that takes three `CGFloat` arguments called `latitude`, `longitude`, and `margin`, and returns an `NSArray`.

Define these methods to return `nil`.

On the `FISLocation` class, declare five methods:

  * `init` — the default initializer that will be overridden,
  * `initWithName:latitude:longitude:` — a designated initializer,
  * `stringByTruncatingNameToLength:` which takes one `NSUInteger` argument called `length` and returns an `NSString`,
  * `hasValidData` which takes no arguments and returns a `BOOL`, and
  * `triviumWithMostLikes` which takes no arguments and returns a `FISTrivium` object.

Define the initializers to assign to `self` a call of `[super init]` and return `self`.

Define the other three methods to return `nil`.

On the `FISTrivium` class, declare two initializers:

  * `init` — the default initializer that will be overridden, and
  * `initWithContent:likes:` — a designated initializer.

Define the initializers to assign to `self` a call of `[super init]` and return `self`.

Run the tests with `⌘` `U` to see that they fail.

### III. Build the `FISTrivium` Class

1. Define `FISTrivium`'s designated initializer.

2. Override `FISTrivium`'s default initializer to call the designated initializer. Default instances of `FISTrivium` should have an empty string for their `content` and no `likes`.

Run the test in `FISTriviumSpec.m` to check the `FISTrivium` class.

### IV. Build the `FISLocation` Class

#### Write the Initializers

1. Define `FISLocation`'s designated initializer.  
**Hint:** *Don't forget to set the* `trivia` *property to the initialization of an empty mutable array.*

2. Override `FISLocation`'s default initializer to call the designated initializer. Default instances of `FISLocation` should have an empty string for their `name` property Have it pass in an empty string for `name`, and coordinates pointing to the intersection of the equator and the prime meridian (i.e. Latitude 0º, Longitude 0º).

#### Write the Method Implementations

1. Define the `stringByTruncatingNameToLength:` method to return a substring of the location's name shortened to the number of characters defined by the `length` argument. This method should handle a `length` argument integer that exceeds the length of the location's `name` string; in such a case, it should just return the location's whole name.  
**Hint:** `NSString` *has a handy method called* `substringToIndex`.

2. Define the `hasValidData` method to:
  * return `NO` if the `name` property is an empty string or `nil`,
  * return `NO` if the `latitude` property is beyond `-90.0` and `90.0`,
  * return `NO` if the `longitude` property is beyond `-180.0` and `180.0` or if it is equal to `-180.0` (since this longitude conceptually matches the 180º meridian), and
  * otherwise return `YES`.

3. Define the `triviumWithMostLikes` method to:
  * return `nil` if the `trivia` array is empty, otherwise
  * return the `FISTrivium` object in the `trivia` array that has the highest value for the `likes` property.  
  **Hint:** *You can accomplish this with either a* `for in` *loop &  an* `if` *statement, or by using* `NSSortDescriptor`.
  
### V. Write the `FISAppDelegate` Method Implementations

1. Define the `allLocationNames` method to return an array of all of the `name` string properties of the `FISLocation` objects held in the `locations` array property.

2. Define the `locationWithName:` method to return a `FISLocation` object whose `name` string property matches the string submitted to the `name` argument. If there isn't a match, this method should return `nil`.  
**Hint:** *You can accomplish with either a* `for in` *loop &* `if` *statement, or by using* `NSPredicate`.

3.	Define the `locationsNearLatitude:longitude:margin:` method to return an array of all the locations whose coordinates are within ±`margin` degrees from the given location.  
**Note:** *This is intended to be a simple implementation of local cartography. The test data only contains locations on Manhattan. You do NOT need to spend time programming for edge cases of detecting locations across the poles or across the 180º meridian. For actual mapping implementations, the Apple framework* `MapKit` *would be used.* 