[Sprint Home](DeveloperSprintSummer2010.md)

# Introduction #
Recurring Donations is a separate package that allows for easier creation of multiple donations for a single donor.

# Current State #
The Recurring Donation object hold parameters that on save are used to generate n Opportunities with appropriate information.

# Problems with current State #

  * Opportunity data doesn't roll up to the Recurring Donation
  * Changes to Opportunity are not reflected in the aggregate numbers of the Recurring Donation

## Open Issues ##
  * http://code.google.com/p/npsp/issues/detail?id=100
  * http://code.google.com/p/npsp/issues/detail?id=128
  * http://code.google.com/p/npsp/issues/detail?id=160

# Potential Course of Action #

  * Make minor changes
  * Completely rewrite recurring donations to behave more like a true payments system
    * payments are children of opportunities (ALA Groundwire)

# Implementation Details #
## Impact on current install base ##

# Pros and Cons of Course of Action #

  * 