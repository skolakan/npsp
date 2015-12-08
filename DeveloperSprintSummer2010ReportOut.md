# Introduction #

June 9-11, 11 people gathered in San Francisco for the first inaugural developer sprint. There were 6 community members, 3 Foundation staff, and 2 Salesforce.com employees.

We started out the first morning with a quick round-the-table intro session. After that I (Steve Andersen) did a quick intro to the nonprofit starter pack to get everyone on the same page. Some of the folks at the table knew the starter pack very well, others were new to it.

Next, I ran down the list of potential projects, explaining them in detail and answering questions as they came up. Everyone then selected which projects they wanted to be a part of. We generally broke into teams of two, with a couple folks taking on projects on their own.

From there the teams began design conversations--how best to proceed in addressing the projects they had chosen. Conversations were fluid and brought other team members in frequently. There was a real feel that everyone was open to help out everyone else, and experience and input was shared constantly through the day. We had technical experts and domain experts in the room. When someone had a question, they would ask it of someone specific across the room. Others would listen and chime in if they had input. There was usually a short discussion and then work resumed.

I floated most of the day, giving NPSP-specific advice as necessary, helping with environments, and logistics of meals, facilities and technology.

At the end of the first day we did a quick run down of where we stood on our projects, which was a good exercise.

After lunch on the last day we did a demo of each project. It was great to see all the projects in completed form, or in progress as the case was.

# What did we get done? #

  * Contact Merge interface
    * Akhilesh Gupta and Jason Venable improved the contact merge included with the NPSP by adding paint your perfect record functionality
    * Youtube demo: http://www.youtube.com/watch?v=CA4kjsaOgbo
    * Status: code is committed to the package and will be included in next release
  * Lead Conversion improvements
    * create Opportunities when converting leads
    * merge leads to existing contacts
    * Status: code is committed to the package and will be included in next release
  * Batch Rollups
    * Dave Manelski and Nick Bailey modified Groundwire's Opportunity rollup code to work with the nonprofit starter pack
    * This will be part of the Household package
    * You'll be able to get rollups and turn off Householding if you want
    * Rollups will work in the one-to-one and the individual account model
    * Rollups will be calculated for contacts, accounts, and households
    * There are an amazing array of rollup information in this code! Significanly better than what’s possible with rollup summary fields alone
    * Dave and Nick built a VisualForce configuration page to control how the rollups work
    * Integrating this into the Household package still has significant work left, but an amazing amount of work was accomplished
  * Household Naming
    * Evan Callahan modified Groundwire's Householding code to work with the nonprofit starter pack
    * Household names change as Household member names change
    * you can turn off the automatic naming for specific households
    * There is work left to do to integrate this into the Households package and allow people to keep the current Household naming functionality if they want it
  * Automatic Opportunity Contact Roles
    * David Cheng built an Opportunity trigger that will add a primary Contact Role for the contact on an Opportunity
    * doing this at the trigger level will simplify Opportunity imports
  * Opportunity Payments
    * Sara Chieco built a way to have payments as children of Opportunities
    * this is a very promising way of tracking recurring donations, payment plans, and cash vs. recognized revenue
    * there is significant work to get this incorporated, and outstanding questions about how to include it in the NPSP

# What worked? #

  * amazing group of people
  * good collaboration
  * communal dinners were great for getting to know folks
  * periodic checkins about where people are on their projects
  * demo of all code at the end of the sprint
  * having very knowledgeable staff from Salesforce.com there was really great. Andrew Waite was able to definitively answer any Apex of VF question, complete with historical info about when and why. Ron Hess gave great implementation advice.
  * It was great to have a mix of coding skill level--great learning opportunities

# What didn't work? #

  * would have been better to have customer need tied to the projects - e.g. 10 customers need to create Opps on lead conversion
  * conference rooms get old by the end of the day
  * it would be great to have more people next time

# Next time? #

I want to replicate this event as I think it was very successful. Because everyone was a volunteer and covered their own travel and lodging, it was a very low-cost event. Now that we've done one successful event I would consider doing a larger event, having remote attendees, and other ideas.

Thanks again to Ron Hess, Jason Venable, Sara Chieco, David Cheng, Andrew Waite, Dave Manelski, Akhilesh Gupta, Evan Callahan, Nick Bailey and Steve Wright! Amazing work everyone!