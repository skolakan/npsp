# Introduction #

Contact merging is not easy to do in the One-to-one model. In Salesforce.com Contact merge is initiated from the Account record, which you can't get to in the one-to-one model.

Also, merging Contacts won't deal with the one-to-one Accounts. Those Accounts need to be merged as well. [Issue 42](https://code.google.com/p/npsp/issues/detail?id=42) addresses the existing problem. [Issue 41](https://code.google.com/p/npsp/issues/detail?id=41), is a related problem--in the one-to-one model Lead Conversion doesn't allow for merging to existing Contacts.

# Proposal #

We build a VisualForce Contact merging interface accessed via a Tab. The User searches for a Contact by name.

![http://gokubi.com/images/contact_merge_1.png](http://gokubi.com/images/contact_merge_1.png)

A list of matching Contacts is returned. The User can select up to 3 Contacts for merging.

![http://gokubi.com/images/contact_merge_2.png](http://gokubi.com/images/contact_merge_2.png)

I propose that version 1 of the merge functionality has one winning Contact, and the others are merged away. I don't propose to build the "paint your perfect record" interface that exists in the Salesforce.com standard Contact merge. This could be added in a future release.

![http://gokubi.com/images/contact_merge_3.png](http://gokubi.com/images/contact_merge_3.png)

Clicking the merge button first merges the one-to-one Accounts for the selected Contacts. It then merges the selected Contacts, leaving one Contact and one Account, correctly connected.

# Benefits #

This interface and functionality is fairly well defined, and not overly complex. It would get merge functionality out the door relatively quickly.

# Drawbacks #

We would not have the paint your perfect record interface of standard Salesforce.com.

# Deployment #

This could be included in the Contacts and Organizations package. Because it is called from a Tab, it is easily hidden.

Here is a screen movie of a prototype of the interface. Please watch and comment if you're interested.

http://www.youtube.com/watch?v=5uslRBWPiB0&fmt=22

New update on 1/30/09:

http://www.youtube.com/watch?v=LLod654cl0Y&fmt=22

Iteration 3:

http://www.youtube.com/watch?v=3Ae_9SqXPF0&fmt=22

Iteration 5:

http://www.youtube.com/watch?v=0iPNCJgvGTM&fmt=22