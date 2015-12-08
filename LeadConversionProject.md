[Sprint Home](DeveloperSprintSummer2010.md)

# Introduction #
Nearly every Salesforce org needs to convert leads. Either they have a business process that includes Leads, or they're using Web to Lead to get Contacts into their database.

# Current State #
Lead conversion doesn't work as might be expected in the one-to-one Account model.

  * set the Company = "Self" or a match of the lead's name and it converts to a new one-to-one contact
  * The Lead conversion interface is not shown when converting a one-to-one lead.
  * In the Individual Account model, it proceeds normally

# Problems with current State #

  * in the one-to-one model
    * an Opportunity cannot be created when converting a Lead
    * Leads can't be merged to existing Contacts

## Open Issues ##
  * http://code.google.com/p/npsp/issues/detail?id=15
  * http://code.google.com/p/npsp/issues/detail?id=41
  * http://code.google.com/p/npsp/issues/detail?id=90
  * http://code.google.com/p/npsp/issues/detail?id=161

# Potential Course of Action #

  * build a lead conversion UI to allow for merging and Opportunity creation

# Implementation Details #

## Notes ##
  * There were no new pages or classes created. The existing leadConvertOverride.page and LeadConvertOverride.cls were modified.
  * The new process stops on the leadConvertOverride page if the lead is identified as a one-to-one lead.
  * Functionality added. Merge to existing Contact. Create opportunity upon conversion. Set owner of any newly created records. Notify new owner (Standard lead convert option, no custom email/workflow). Set converted status of lead if org has more than one option for converted status.
  * TEST\_LeadConvertOverride class was updated with new unit tests with coverage around 93%.

## Impact on current install base ##
  * No new fields, class, pages were created so metadata impact should be minimal.
  * Users that are familiar with current one-to-one convert behavior may be caught off guard.

## Pros and Cons of Course of Action ##
  * PRO: Added features.
  * ACTION: Notify users of changed behavior/new features.