## Current State ##

Lead Conversion has a couple issues right now:
  1. [Email and Phone fields aren't handled  correctly](http://code.google.com/p/npsp/issues/detail?id=79)
  1. [Email and Phone validation rules can stop Lead Conversion](http://code.google.com/p/npsp/issues/detail?id=87)
  1. [Leads can't be merged to existing Contacts in the one-to-one model](http://code.google.com/p/npsp/issues/detail?id=41)

The first two issues have to do with Email and Phone fields and how they are handled on the Contact object.

Right now there are multiple email and phone fields. The user selects Preferred Email and Preferred Phone, and the standard Email and Phone fields get filled from the preferred subsidiary field via workflow.

## How to architect phone and email fields on Leads? ##

Leads can be converted to Contacts. When that happens, data in the Lead fields can be brought over to the Contact. This happens automatically for some standard fields, like email, and you can set up custom mapping for custom fields.

You cannot easily map custom fields to standard fields, or vice versa.

So, there are two options for the Nonprofit Starter Pack:

  1. Create Preferred Email and Preferred Phone picklists on Lead
  1. Create all the secondary Email and Phone fields on Lead

Following #1 is the easiest option. On the Lead, email is entered, as is the preferred value. The email and phone then land in the standard fields and are written to the appropriate custom field as well.

In a web-to-lead scenario, we want to collect as little info as possible. So the email address can be collected. If the Preferred Email isn't entered, the default value on the Contact Preferred Email field is used and the email address lands in the standard field and the appropriate custom field.

If we follow #2, we don't lose any of the functionality of #1. But we do have the option of then creating Leads with more than one email address and mapping those through directly.

We cannot, however, create fields on the Lead for Home Phone and Other Phone. Since these are standard fields on Contact, but are not standard fields on Lead, we can't map them through.

Because we can't do a complete solution, I'm leaning toward #1, with instructions how to do #2 manually, explaining the limitations.