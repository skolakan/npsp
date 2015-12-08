#Log and results from the code optimization project

# Introduction #

The code optimization project goal as initially stated was:

```
    * SOQL
    * custom settings
          o ability to turn-off triggers without uninstalling 
    * exception handling "
```

Possible outcomes from this project also include:

  * code reduction
  * performance improvement
  * governor limit recovery (reduced footprint)
  * better exception handling
  * refactoring tasks that may be performed later

# Approach #

Prior to the project starting the following snapshots will be taken:

  * running the code through the security analyzer
  * running all existing tests
  * basic profiling of pages using viewstate inspector, apex csi for performance and governor limit consumption.

# Security Scanner results (before) #

The security scanner resulted in the following results:

## Test methods with no asserts: ##

### npo02.test\_householdopportunity.cls ###

  * static testMethod void HouseholdOpportunity()

### npo02.test\_households.cls ###

  * static testMethod void Households\_Test()

### npe03.bulktest.cls ###

  * static testMethod void bulkInsertOpportunities()

### npe03.recurringdonations\_test.cls ###

  * static testMethod void RecurringDonations()

### npe5.test\_affiliations.cls ###

  * static testMethod void Affiliations\_Test()

### npe01.test\_accountviewoverride.cls ###

  * public static testMethod void accountViewOverride()
  * public static testMethod void noAccount()

### npe01.test\_individualaccounts.cls ###

  * static testMethod void IndividualAccounts()
  * static testMethod void getContactDonationHistory()

### npe01.test\_leadconvertoverride.cls ###

  * public static testMethod void newLeadWithCompanyMatchingLeadName\_Test()

## Sharing Violations: ##

### page: accountviewoverride ###

  * controller extension: npe01.accountviewoverride.cls

### page: contactmerge ###

  * controller extension: npe01.contactmergecontroller.cls

### page: leadconvertoverride ###

  * controller extension: npe01.leadconvertoverride.cls

## Cross-site request forgery ##

### npe01.leadconvertoverride.cls ###

```
...
12. String lId = ApexPages.currentPage().getParameters().get('id');
...
21. lc.setLeadId(lId);
22. lc.setDoNotCreateOpportunity(true);
...
24. lc.setConvertedStatus(convertStatus.MasterLabel);
25. Database.LeadConvertResult lcr = Database.convertLead(lc);
```

## Multiple forms in a Visualforce page ##

### contactmerge.page ###
```
...
20. <apex:form id="searchForm">
...
63. <apex:form >
...
90. <apex:form >
```

# Test results #

## Before ##

  * runalltests: 68 tests, 31.07 seconds (averaged across 10 runs), 81% coverage

# Change Log #

this is where my changes will be logged.