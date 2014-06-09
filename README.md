---
tags: objects, methods, dictionary
language: objc
---

#Location Trivia Objects

In the last lab you dealt with `NSDictionary` object representation of locations. Now lets convert these to proper classes and add in trivia items!

## Instructions

 1. First create a new `FISLocation` class, add in the properties from the `NSDictionary`. So name, latitude and longitude
 2. Move the `shortenLocationName` method to an instance method for your `FISLocation` class. Do you need the `NSDictionary` location argument anymore?
 3. Modify the `getLocationNamesWithLocations` method to take an `NSArray` of `FISLocation` objects and just return their names
 4. Move the `verifyLocation` method to be an instance method for `FISLocation` and still return `YES` or `NO` whether the `FISLocation` has all of it's properties filled out. **Let's add one more feature: Longitudes should be between -180 and +180. Latitudes should be between -90 and +90**
 5. Modify the `searchForLocationName:inLocations:` method to search an `NSArray` of `FISLocation` objects.
