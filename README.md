#Location Trivia Objects

In the last lab you dealt with `NSDictionary` object representation of locations. Now lets convert these to proper classes and add in trivia items!

## Instructions

 1. First create a new `FISLocation` class, add in the properties from the `NSDictionary`. So name, latitude and longitude
 2. Move the `shortenLocationName` method to an instance method for your `FISLocation` class. Do you need the `NSDictionary` location argument anymore?
 3. Create an initializer that takes in the three properties and assigns them correctly
 4. Modify the `getLocationNamesWithLocations` method to take an `NSArray` of `FISLocation` objects and just return their names
 5. Move the `verifyLocation` method to be an instance method for `FISLocation` and still return `YES` or `NO` whether the `FISLocation` has all of it's properties filled out
 6. Modify the `searchForLocationName:inLocations:` method to search an `NSArray` of `FISLocation` objects.
 7. Create a new class called `FISTrivia`. This class should have the following properties:

    ```
    - (NSString *) content
    - (NSInteger) likes
    ```

  8. Add an `NSMutableArray` property to `FISLocation` to hold trivia items
  9. Write a method called `topTrivia` that returns the trivia item with the most likes. Where should this method go?
  10. Create an initializer for `FISTrivia` that takes an argument for all of the properties and sets them appropriately


