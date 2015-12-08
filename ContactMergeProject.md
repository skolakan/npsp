[Sprint Home](DeveloperSprintSummer2010.md)

# Introduction #

Salesforce.com can easily be filled with duplicate data, either because of user error or web-to-lead activities. The platform has an interface for merging Contacts in the same Account. It allows you to paint a perfect record and then merge the Contacts, automatically reparenting the children.

# Current State #

The one-to-one Account model currently does not work with the standard Salesforce merge so we built an interface to allow for finding Contacts and merging them.

# Problems with current State #

  * the merge interface doesn't allow for painting a perfect record
  * usability and visual quality of the interface is less than ideal
  * not all fields are shown in the merge interface
  * Users cannot control the fields that are shown in the merge interface

## Open Issues ##
  * http://code.google.com/p/npsp/issues/detail?id=124

# Potential Course of Action #

  * Modify the Merge interface for better usability and visual appeal
  * allow for viewing all relevant Contact fields
  * build a paint-a-perfect record interface

  * look for potential dupes on lead conversion and put them in the same one to one--makes finding dupes easier

# Implementation Details #
## Impact on current install base ##

# Pros and Cons of Course of Action #

  * the more complex the interface gets the harder to support
  * 