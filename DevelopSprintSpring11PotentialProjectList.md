# Introduction #

This is a list of possible projects  (in no particular order) for the Spring 2011 NPSP Developer Sprint (4/27-29/11).  These are just _suggested_ projects. Please feel free to develop, discuss or otherwise build **any** code or project you're interested in exploring as an addition to the NPSP as part of the event. Please contact me directly if you have any questions!
-Kevin


# Potential Projects List #


## **1. Batch Gift Entry** ##

#### _Introduction_ ####
  * Currently, there is not an easy way to batch enter gifts. This    functionality would allow organizations to easily enter multiple gifts and submit them in batch.

#### _Current State_ ####
  * Utilizing the Apex Data Loader is currently the only way to provide this functionality

#### _Problems with Current State_ ####
  * The Data Loader operation for batch opportunity entry is not intuitive for non-technicaly or end-users

#### _Open Issues_ ####

#### _Potential Course of Action_ ####
  * http://www.convio.com/common-ground/videos/batch.html

#### _Implementation Details_ ####
  * Will be limited to Households or Contacts/Orgs package, which removes the possibility of utilizing relationships/affiliations along with the package



&lt;hr&gt;



## **2. Interstitial Opportunity Pages/Wizard** ##

#### _Introduction_ ####
  * Because a Contact ID is not known until Salesforce automatically adds the OCR to the Opp on insert, we cannot add OCRs for non 1x1 contact household members. This can be solved by created an interstitial new donation page, which then forwards a selected contact ID to the donation for proper household OCR creation and handling.

#### _Current State_ ####
  * Creating a new opportunity for a non 1x1 contact results in no HH OppContactRoles

#### _Problems with Current State_ ####
  * This is inconsistent behavior between the two account models

#### _Open Issues_ ####
  * http://code.google.com/p/npsp/issues/detail?id=201

#### _Potential Course of Action_ ####
  * With dynamic VF binding, we can now create a VF page to function as a ‘forwarder’ to the opportunity, and override the new button for new donations, w/o restricting the end user to the content defined in the VF page

#### _Implementation Details_ ####
  * Variations of this exist in various other template, would need to be modeled for both 1x1 and bucket accounts



&lt;hr&gt;



## **3. Lead Conversion Improvements** ##

#### _Introduction_ ####
  * Jason Venable and Evan Callahan created some awesome lead conversion code for the NPSP last year, can we take it to the next level?

#### _Current State_ ####
  * Creating a new opportunity for a non 1x1 contact results in no HH OppContactRoles
  * Lead conversion works but does not allow you to merge to an existing Contact or create an Opportunity upon Lead conversion

#### _Problems with Current State_ ####
  * This is inconsistent behavior between the two account models

#### _Open Issues_ ####
  * http://code.google.com/p/npsp/issues/detail?id=237
  * http://code.google.com/p/npsp/issues/detail?id=214

#### _Potential Course of Action_ ####
  * Override standard lead conversion to allow proper handling of bucket or 1x1 contacts, depending on the model

#### _Implementation Details_ ####
  * Have a VF implementation in C& O. Some matching with existing Households would be a potentially cool feature, but would need to shift to HH package



&lt;hr&gt;



## **4. Help & Resources Interface** ##

#### _Introduction_ ####
  * Creation of a new interface for basic help and issue logging

#### _Current State_ ####
  * The current ‘About the NPSP’ tab frames in a page from the Foundation website with links to other resources

#### _Problems with Current State_ ####
  * There’s not a clear area to log bugs, ask questions, or access community resources.

#### _Open Issues_ ####

#### _Potential Course of Action_ ####
  * Continue to utilize some sort of framed dynamic content
provide a more intuitive and accessible interface for bug logging directly to Google Code project via the issue tracker API: http://code.google.com/p/support/wiki/IssueTrackerAPI
  * Provide tab-able interface to help/support forums
  * Utilize existing sites for feature requests
  * Can authenticate via standalone or Oauth, may want standalone to make it easier for end user

#### _Implementation Details_ ####
  * VF for page
  * Google Code API and OAuth for Issue Tracker authentication and posting



&lt;hr&gt;



## **5. Update Notifications** ##

#### _Introduction_ ####
  * We need a way to notifiy end users that a new version of the NPSP or specific packages is available for download.

#### _Current State_ ####
  * Less than 25% of Contacts & Organizations active users (logged in in the past 30 days) are on 2.x and above of Contacts & Orgs


#### _Problems with Current State_ ####
  * Continued support of older version adds to the support burden, as well as prevents orgs from utilizing new features and functionality as they’re released

#### _Open Issues_ ####

#### _Potential Course of Action_ ####
  * Provide a way for each package to occasionally (weekly? monthly?) ‘call out’ to an endpoint (the Foundation can provide this) and determine if the current running version is the newest version.
  * May need to record the current version as a final var in teh managed package to make querying easier

#### _Implementation Details_ ####
  * Would need to be implemented for each package seperately, but the mechanism and notification process should be identitical
  * Pushable to existing orgs?
  * Should provide notification either in the org itself, or notify admin users via email



&lt;hr&gt;



> ## **6. Multi-directional Relationships-Affiliations** ##

#### _Introduction_ ####
  * Relationships between a Contact and another Contact are not directional--there is no way to track who referred the other besides using record auto-numbers

#### _Current State_ ####
  * Relationships are uni-directional, do not understand multifaceted relationships (brother/sister, etc.)

#### _Problems with Current State_ ####
  * Inflexibility and inability to allow extensive customization and still automate the process

#### _Open Issues_ ####
  * http://code.google.com/p/npsp/issues/detail?id=173

#### _Potential Course of Action_ ####
  * Custom setting to define relationship direction? Some other method?

#### _Implementation Details_ ####



&lt;hr&gt;



## **7.  Membership Improvements** ##

#### _Introduction_ ####
  * You can call out a single opportunity record type as a membership type for seperate donation rollups

#### _Current State_ ####
  * Membership rollups allow you to assign an opportunity recordtype as a ‘Membership’ type, and then ‘rollup’ that information to contact, account and household records
  * Supports ‘Status’ on the Household. Other fields are defined, but not necessarily implemented

#### _Problems with Current State_ ####
  * Does not allows flexibility in assignment, statuses, etc.

#### _Open Issues_ ####

#### _Potential Course of Action_ ####
  * Expansion to include membership levels, tiers, etc.

#### _Implementation Details_ ####



&lt;hr&gt;



## **8.  User Defined Rollup Expansion** ##

#### _Introduction_ ####
  * Version 2.1 will introduce user defined rollups for opportunities to households, accounts or contacts over the opportunity contact role.

#### _Current State_ ####
  * Users can define rollups across the OCR by utilizing the UDR wizard

#### _Problems with Current State_ ####
  * Does not support filter criteria (rollups for specific record types or criteria)

#### _Open Issues_ ####

#### _Potential Course of Action_ ####
  * Expand the functionality of the existing opportunity rollups and wizard to include a new rollups set utilizing user defined filter criteria

#### _Implementation Details_ ####



&lt;hr&gt;



## **9.  Household Name/Greeting Customization** ##

#### _Introduction_ ####
  * Version 2.1 will introduce automatic household name and greetings (formal and informal)

#### _Current State_ ####
  * Household name, formal and informal greeting are created automatically on contact update

#### _Problems with Current State_ ####
  * Does not allow modifications of the default pattern for  household names or greetings

#### _Open Issues_ ####
  * http://code.google.com/p/npsp/issues/detail?id=3

#### _Potential Course of Action_ ####

#### _Implementation Details_ ####



&lt;hr&gt;



## **10.  Custom Validation Error Notification** ##

#### _Introduction_ ####
  * The majority (33%+) of the errors recorded by NPSP users are related to record updates on objects that have custom validation

#### _Current State_ ####
  * Apex has to play by the same rules as the rest of us, which means honoring custom validation
  * When rollups update records that have user defined custom validation, those updates fail, without warning

#### _Problems with Current State_ ####
  * Opportunity rollups, household creation, etc., can fail, without sufficient notice as to ‘why’

#### _Open Issues_ ####

#### _Potential Course of Action_ ####
  * Catch all insert/update calls for custom validation exceptions, trigger some sort of notification back to the user of the potential issue.
  * A setting for email notification or on screen notification?
  * Page warning in custom settings or oppty rollup screen? Not enough?
  * Provide userful information to user about how to resolve issue

#### _Implementation Details_ ####



&lt;hr&gt;



## **11.  Recurring Donations Improvements & Recalculations** ##

#### _Introduction_ ####
  * Recurring donations allow users to create a group of opportunities ‘under’ a common parent object.  Sara Chieco wrote some great payments code that has yet to be implemented.

#### _Current State_ ####
  * Payments are not currently implemented for Recurring Donations

#### _Problems with Current State_ ####
  * Once the recurring donations object is created, opportunities are not updated or changed with updated to the recurring donations object, or uncollectable donations
  * There’s currently no way to pass custom/other values to recurring donations being created
  * Payments are not yet implemented

#### _Open Issues_ ####
  * http://code.google.com/p/npsp/issues/detail?id=208
  * http://code.google.com/p/npsp/issues/detail?id=209
  * http://code.google.com/p/npsp/issues/detail?id=211

#### _Potential Course of Action_ ####

#### _Implementation Details_ ####



&lt;hr&gt;



## **12.  Trigger Toggles** ##

#### _Introduction_ ####
  * This project would seek to add control over the record triggers in the NPSP for developers

#### _Current State_ ####
  * Triggers in the NPSP are currently not overridable

#### _Problems with Current State_ ####
  * Substituting custom functionality for the NPSP standard functionality is very difficult (impossible?)

#### _Open Issues_ ####

#### _Potential Course of Action_ ####
  * Allow triggers to be turned off/on via custom settings.
  * MUST be locked down to prevent accidental changes

#### _Implementation Details_ ####