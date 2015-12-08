
# Intro #

Wednesday June 9 through Friday June 11, 2010, in San Francisco, California. A planned and focused sprint to improve and augment the Nonprofit Starter Pack.

# Report Out #
[Report Out](DeveloperSprintSummer2010ReportOut.md)

# Main Points #
## Who is doing this? ##
A small group of folks interested in nonprofits on Salesforce.com:
  1. Salesforce.com implementers
    1. Evan Callahan, http://groundwire.org, evan@groundwire.org
    1. David Cheng, http://idealistconsulting.com
    1. Sara Chieco, http://exponentpartners.com
    1. Dave Manelski, http://groundwire.org
    1. Jason Venable, http://www.tehnrd.com/
    1. Nick Bailey, http://helpsudaninternational.org
  1. Salesforce.com company staff
    1. Ron Hess
    1. Andrew Waite
  1. Salesforce.com Foundation staff
    1. Steve Andersen
    1. Akhilesh Gupta
    1. Steve Wright

We will break into groups of about 3 and work on coding efforts in small teams.

## Why are we doing this? ##
The Nonprofit Starter Pack is in use by thousands of organizations. We will never be satisfied with the speed at which is improves. This is an effort to move the code-base forward through an intense effort of some of the best minds in our space.

## Our goals ##
  1. Create deployment-ready code for the Nonprofit Starter Pack that addresses key gaps/issues that will make Nonprofits more effective
  1. Strengthen the relationships in our community
  1. Share knowledge

# Details #
## Work selection ##
I have developed a list of potential projects that could be tackled in a sprint. I will define these in detail before the sprint. Attendees will be asked to review the list and help with the plan of attack for each. At the sprint we'll break into groups and tackle the work, with a general plan of attack already in place. While we will be open to changing implementation details, the goal is to walk in the first day with an idea of how to solve each of these, rather than start by brainstorming solutions.

## Potential Work ##
  * BatchRollupProject - Ready for review
  * ContactMergeProject - In development
    * paint a perfect record
    * what to do with parent records?
  * HouseholdSyncProject - Ready for review
  * OpportunityContactRoleProject - Ready for review
    * relationship to contact?
    * wizard for creation?
    * trigger for CR creation
  * MembershipProject
  * LeadConversionProject - Ready for review
    * email and phone fields
    * interface for opp creation
    * field mapping
  * RecurringDonationsProject

All of the code and config is in the "Integration 3" instance:

&lt;BR/&gt;


Changed Existing:

&lt;BR/&gt;


Opportunity Object

&lt;BR/&gt;


Constants.cls

Added:

&lt;BR/&gt;


Payment Object

&lt;BR/&gt;


Payment Tab

&lt;BR/&gt;


Recurrence Information Object

&lt;BR/&gt;


Recurrence Information Tab

&lt;BR/&gt;


3 Opportunity Page Layouts: Donation (NPSP), Grant (NPSP), Pledge (NPSP)

&lt;BR/&gt;


3 Opportunity Record Types: Donation (NPSP), Grant (NPSP), Pledge (NPSP)

&lt;BR/&gt;


FundraisingSettings custom settings

&lt;BR/&gt;


TestOpportunityPayments.cls - 100% coverage

&lt;BR/&gt;


OpportunityPayments.cls

&lt;BR/&gt;


FundraisingOpportunity.trigger

Code is commented and complete.
New payment is created for One-time Donation, kept in synch while there is just one.
New Payment(s) are created for payment plan. May want to put a validation rule on the Payment Plan fields so if they put in a number of payments, they need to add the frequency and vice versa and making those two fields required if they select the Type = 'Payment Plan'.

TODO:
Add the one Field in the FundraisingSettings custom settings object to one of the newly created Custom Settings UI's made by Dave or David.

  * RelationshipsProject
    * Directionality
    * list custom settings for relationship values?
    * Visualizer for relationships and associations?
  * CodeOptimizationProject - In development
    * SOQL
    * custom settings
      * ability to turn-off triggers without uninstalling
    * exception handling
  * DocumentationProject

## Time and Location ##
The sprint will be held at the Salesforce.com corporate offices in San Francisco on June 9-11, 2010. The sprint will begin at 9 am June 9th.

## Agenda ##
| **Wednesday June 9** |Noa, 9th Spear|
|:---------------------|:-------------|
| 9 am - noon          | Kickoff      |
| noon - 1:30 PM       | Lunch        |
| 1:30 pm - 6 PM       | Afternoon session |
| 6 pm - 7:30 PM       | Dinner - [Osha Thai](http://www.yelp.com/biz/osha-thai-san-francisco-3) |
| 7:30 pm - whenever   | Evening session |
| **Thursday June 10** |Noa, 9th Spear|
| 9 am - noon          | Morning Session |
| noon - 1:30 PM       | Lunch        |
| 1:30 pm - 6 pm       | Afternoon session |
| 6 pm - whenever      | Dinner - [R&G Lounge](http://www.yelp.com/biz/r-and-g-lounge-san-francisco) |
| **Friday June 11**   |Oahu, 4th Landmark|
| 9 am - noon          | Morning Session |
| noon - 1:30 PM       | Lunch        |
| 1:30 pm - 5 pm       | Afternoon session and wrap up |

[Calendar for the Event](http://www.google.com/calendar/embed?src=m4ntng5pkkri9m9p6g11kbq3u4%40group.calendar.google.com&ctz=America/Los_Angeles)

# Tech links #
## Orgs ##
  * Integration Orgs
    * integrate@project1.integration
    * integrate@project2.integration
    * integrate@project3.integration
    * integrate@project4.integration
    * integrate@project5.integration
  * Individual Orgs
    * gokubi@npspsprint.dev
    * wrightenich@npspsprint.dev
    * akhilesh.iitd@npspsprint.dev
    * jason.venable@npspsprint.dev
    * davemanelski@npspsprint.dev
    * evan@npspsprint.dev
    * vnehess@npspsprint.dev
    * davidtraveller@npspsprint.dev
    * sarachieco@npspsprint.dev
    * sfdc.awaite@npspsprint.dev
    * nick@npspsprint.dev
## Subversion ##
  * Each integration project has a repository location here
    * http://code.google.com/p/npsp/source/browse/#svn/sprint2010
  * To create a Force.com project connected to Subversion
    * Create a new repository for the google code project
    * navigate to your integration branch
    * right click the project folder and select Checkout
    * checkout using the new project wizard
    * enter the force.com credentials for your integration org
    * select no metadata
    * finish
## Packages ##
  * [Contacts and Orgs Unmanaged](https://login.salesforce.com/?startURL=%2Fpackaging%2FinstallPackage.apexp%3Fp0%3D04t80000000j7IX)
  * [Relationships Unmanaged](https://login.salesforce.com/?startURL=%2Fpackaging%2FinstallPackage.apexp%3Fp0%3D04t80000000lIjF)
  * [Recurring Donations Unmanaged](https://login.salesforce.com/?startURL=%2Fpackaging%2FinstallPackage.apexp%3Fp0%3D04t80000000jL9R)
  * [Affiliations Unmanaged](https://login.salesforce.com/?startURL=%2Fpackaging%2FinstallPackage.apexp%3Fp0%3D04t80000000YL5r)
  * Households cannot be offered unmanaged because it is an extension of Contacts and Organizations
    * https://login.salesforce.com/?startURL=%2Fpackaging%2FinstallPackage.apexp%3Fp0%3D04t80000000jLAo