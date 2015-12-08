[Sprint Home](DeveloperSprintSummer2010.md)

# Introduction #
Tracking relationships between people is how a social graph can be created in the nonprofit starter pack.

# Current State #
The Relationships package allows for the relating of two Contacts to each other. Metadata about the relationship inludes Type, Status and description. Because this object has 2 relationships to Contact, it would have two related lists. To get around this confusion, Apex creates 2 records for each relationship and links them together. This is implemented along the lines of the Partner object.

# Problems with current State #

  * There is no directionality of Relationships--it is impossible to say one Contact referred another, for example

## Open Issues ##
  * http://code.google.com/p/npsp/issues/detail?id=173

# Potential Course of Action #

  * 

# Implementation Details #
## Impact on current install base ##

# Pros and Cons of Course of Action #

  * 