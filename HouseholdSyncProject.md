[Sprint Home](DeveloperSprintSummer2010.md)

# Introduction #

Household is a custom object that is a parent of Contact. It is used to group Contacts at their physical mailing address.

# Current State #

  * trigger on contact
  * name generation
  * address copying
  * formula field back down


# Problems with current State #

  * can't specify naming convention for Household
  * address not kept in sync with Contacts
  * name doesn't sync with contact name change

## Open Issues ##
  * http://code.google.com/p/npsp/issues/detail?id=3
  * http://code.google.com/p/npsp/issues/detail?id=17
  * http://code.google.com/p/npsp/issues/detail?id=56
  * http://code.google.com/p/npsp/issues/detail?id=57

## Packages affected ##
  * Households

# What we Did At the Sprint Event #
  * Added automatic household naming code from NPower/Groundwire
  * Fixed [issue #116](https://code.google.com/p/npsp/issues/detail?id=#116) where households sometimes remained after all contacts were removed from them

# Implementation Details #
  * Households.cls significantly refactored to support automatic naming of households
  * New trigger - HouseholdUpdate - responds to Household Before Update event (calls a method in Households.cls)
  * New fields on Household include Greeting (for Dear John), 3 Automatic Naming checkboxes, Number of Members
  * New fields on Contact include HH Addressee and Greeting (cross-object formulas) and Do Not Include in HH Name
  * Added a custom setting, Automatically Name Households, that indicates whether to use the new feature

# Tasks still TODO #
  1. To support old NPSP installations, put code back in that names new HHs in the old way - run that instead if the AutoNaming setting is not turned on
  1. Fix tests to verify either scenario - old way or new way
  1. Create a button that allows people to upgrade to new scheme by turning on the Auto naming custom setting and then using batch apex to set the 3 Auto Naming checkboxes to true on every existing household
  1. OPTIONALLY - add support for multiple naming options for each of the three naming schemes

## Impact on current install base ##
  * Once the old naming is back in place, no impact - current installs get same old behavior EXCEPT that deleting a contact will never delete the household (that could be fixed)
  * Upgrading is easy - just set all the auto naming boxes as mentioned above