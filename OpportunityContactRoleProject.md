[Sprint Home](DeveloperSprintSummer2010.md)

# Introduction #

When Opportunities are created there is benefit in having them connected to Contacts via Opportunity Contact Roles.

# Current State #

In both Account models, new Opportunities created from UI buttons on the Contact record get OpportunityContactRoles for that Contact through standard Salesforce functionality. The Role on the Contact Role is blank and IsPrimary is true. When Opportunities are created from the API or from somewhere other than buttons on the contact record, the Contact Role is not created.

# Problems with current State #

  * Contact Role Role value is blank for created opps
  * Importing Opportunities is a two step process--create the opps then create the contact roles for the opps
  * Multiple code pieces create opportunities (Recurring Donations, Households) and they all have to manage contact role creation
  * testing is difficult for some functions because of the need for contact role existence before opp triggers can do things like rollup gifts to the contact

## Open Issues ##
  * http://code.google.com/p/npsp/issues/detail?id=100
  * http://code.google.com/p/npsp/issues/detail?id=133

# Potential Course of Action #

  * Build contact role creation into an Opportunity trigger so that the Contact Id is known at the moment of opp insert, no matter where the Opp is inserted from.
  * Create a relationship from Opp to Contact that will hold the contact id
  * Should we build a wizard interface in the UI to make opp creation easier or more functional? see Groundwire's wizard.
  * Modify all code to rely on this service for contact role creation

# Implementation Details #
## Impact on current install base ##

# Pros and Cons of Course of Action #

  * centralizing contact role creation will reduce code redundancy
  * can make Contacts and Orgs package effectively required for all other packages that deal with opps (recurring donations, households)
  * additional relationship could be confusing to Users