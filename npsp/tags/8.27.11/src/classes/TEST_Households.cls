/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TEST_Households {

    /// <name> Households_Test </name>
    /// <summary> test default constructor </summary>
    static testMethod void Households_Test() {
        Households testHouseholds = new Households();
    }

    /// <name> newIndContactAllContactsProcessor </name>
    /// <summary> test insert individual with all contacts processor </summary>
    static testMethod void newIndContactAllContactsProcessor() {
        
        Households_Settings__c householdSettingsForTests = Households.getHouseholdsSettingsForTests(new Households_Settings__c (Household_Rules__c = Households.ALL_PROCESSOR));
        
        Contacts_and_Orgs_Settings__c contactSettingsForTests = Constants.getContactsSettingsForTests(new Contacts_and_Orgs_Settings__c (Account_Processor__c = Constants.ONE_TO_ONE_PROCESSOR));
                
            
        String street = '2345 Elm St.';
        String city = 'Seattle';
        String state = 'WA';
        String zip = '88777';
        String country = 'US';
        Contact con = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS,
            MailingStreet = street,
            MailingCity = city,
            MailingState = state,
            MailingPostalCode = zip,
            MailingCountry = country
        );
        insert con;
        Contact[] createdContacts = [select Household__r.Name,Household__r.MailingStreet__c,Household__r.MailingCity__c,Household__r.MailingState__c,Household__r.MailingPostalCode__c,Household__r.MailingCountry__c,Household__c from Contact where id=:con.id];
        
        Id firstHouseholdId = createdContacts[0].Household__c;
        system.assertEquals(street,createdContacts[0].Household__r.MailingStreet__c);
        system.assertEquals(city,createdContacts[0].Household__r.MailingCity__c);
        system.assertEquals(state,createdContacts[0].Household__r.MailingState__c);
        system.assertEquals(zip,createdContacts[0].Household__r.MailingPostalCode__c);
        system.assertEquals(country,createdContacts[0].Household__r.MailingCountry__c);
        system.assertEquals(Constants.CONTACT_LASTNAME_FOR_TESTS + ' Household',createdContacts[0].Household__r.Name);
        
        //blank out the HH
        con.Household__c = null;
        update con;
        
        createdContacts = [select Household__r.Name,Household__r.MailingStreet__c,Household__r.MailingCity__c,Household__r.MailingState__c,Household__r.MailingPostalCode__c,Household__r.MailingCountry__c,Household__c from Contact where id=:con.id];
        
        system.assertNotEquals(firstHouseholdId,createdContacts[0].Household__c);
        system.assertEquals(street,createdContacts[0].Household__r.MailingStreet__c);
        system.assertEquals(city,createdContacts[0].Household__r.MailingCity__c);
        system.assertEquals(state,createdContacts[0].Household__r.MailingState__c);
        system.assertEquals(zip,createdContacts[0].Household__r.MailingPostalCode__c);
        system.assertEquals(country,createdContacts[0].Household__r.MailingCountry__c);
        system.assertEquals(Constants.CONTACT_LASTNAME_FOR_TESTS + ' Household',createdContacts[0].Household__r.Name);
    }
    
    static testMethod void newPrivateContactAllContactsProcessor() {
        
        Households_Settings__c householdSettingsForTests = Households.getHouseholdsSettingsForTests(new Households_Settings__c (Household_Rules__c = Households.ALL_PROCESSOR));
        
        Contacts_and_Orgs_Settings__c contactSettingsForTests = Constants.getContactsSettingsForTests(new Contacts_and_Orgs_Settings__c (Account_Processor__c = Constants.ONE_TO_ONE_PROCESSOR));
                
            
        String street = '2345 Elm St.';
        String city = 'Seattle';
        String state = 'WA';
        String zip = '88777';
        String country = 'US';
        Contact con = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            Private__c = true,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS,
            MailingStreet = street,
            MailingCity = city,
            MailingState = state,
            MailingPostalCode = zip,
            MailingCountry = country
        );
        insert con;
        Contact[] createdContacts = [select Household__r.Name,Household__r.MailingStreet__c,Household__r.MailingCity__c,Household__r.MailingState__c,Household__r.MailingPostalCode__c,Household__r.MailingCountry__c,Household__c from Contact where id=:con.id];
        
        Id firstHouseholdId = createdContacts[0].Household__c;
        system.assertEquals(street,createdContacts[0].Household__r.MailingStreet__c);
        system.assertEquals(city,createdContacts[0].Household__r.MailingCity__c);
        system.assertEquals(state,createdContacts[0].Household__r.MailingState__c);
        system.assertEquals(zip,createdContacts[0].Household__r.MailingPostalCode__c);
        system.assertEquals(country,createdContacts[0].Household__r.MailingCountry__c);
        system.assertEquals(Constants.CONTACT_LASTNAME_FOR_TESTS + ' Household',createdContacts[0].Household__r.Name);
        
        //blank out the HH
        con.Household__c = null;
        update con;
        
        createdContacts = [select Household__r.Name,Household__r.MailingStreet__c,Household__r.MailingCity__c,Household__r.MailingState__c,Household__r.MailingPostalCode__c,Household__r.MailingCountry__c,Household__c from Contact where id=:con.id];
        
        system.assertNotEquals(firstHouseholdId,createdContacts[0].Household__c);
        system.assertEquals(street,createdContacts[0].Household__r.MailingStreet__c);
        system.assertEquals(city,createdContacts[0].Household__r.MailingCity__c);
        system.assertEquals(state,createdContacts[0].Household__r.MailingState__c);
        system.assertEquals(zip,createdContacts[0].Household__r.MailingPostalCode__c);
        system.assertEquals(country,createdContacts[0].Household__r.MailingCountry__c);
        system.assertEquals(Constants.CONTACT_LASTNAME_FOR_TESTS + ' Household',createdContacts[0].Household__r.Name);
    }
    
     static testMethod void noHouseholdSetting() {
        
        delete [select id from Households_Settings__c];
        Households.getHouseholdsSettings();
        system.Assert(!Households.householdsSettings.Always_Rollup_to_Primary_Contact__c);
     }

    /// <name> newIndContactIndividualsProcessor </name>
    /// <summary> test insert individual with individuals processor </summary>
    static testMethod void newIndContactIndividualsProcessor() {
        
        Households_Settings__c householdSettingsForTests = Households.getHouseholdsSettingsForTests(new Households_Settings__c (Household_Rules__c = Households.ALL_INDIVIDUALS_PROCESSOR));
        
        Contacts_and_Orgs_Settings__c contactSettingsForTests = Constants.getContactsSettingsForTests(new Contacts_and_Orgs_Settings__c (Account_Processor__c = Constants.ONE_TO_ONE_PROCESSOR));
                
        String street = '2345 Elm St.';
        String city = 'Seattle';
        String state = 'WA';
        String zip = '88777';
        String country = 'US';
        Contact con = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS,
            MailingStreet = street,
            MailingCity = city,
            MailingState = state,
            MailingPostalCode = zip,
            MailingCountry = country
        );
        insert con;
        Contact[] createdContacts = [select Household__r.Name,Household__r.MailingStreet__c,Household__r.MailingCity__c,Household__r.MailingState__c,Household__r.MailingPostalCode__c,Household__r.MailingCountry__c,Household__c from Contact where id=:con.id];
        
        Id firstHouseholdId = createdContacts[0].Household__c;
        system.assertEquals(street,createdContacts[0].Household__r.MailingStreet__c);
        system.assertEquals(city,createdContacts[0].Household__r.MailingCity__c);
        system.assertEquals(state,createdContacts[0].Household__r.MailingState__c);
        system.assertEquals(zip,createdContacts[0].Household__r.MailingPostalCode__c);
        system.assertEquals(country,createdContacts[0].Household__r.MailingCountry__c);
        system.assertEquals(Constants.CONTACT_LASTNAME_FOR_TESTS + ' Household',createdContacts[0].Household__r.Name);
        
        //blank out the HH
        con.Household__c = null;
        update con;
        
        createdContacts = [select Household__r.Name,Household__r.MailingStreet__c,Household__r.MailingCity__c,Household__r.MailingState__c,Household__r.MailingPostalCode__c,Household__r.MailingCountry__c,Household__c from Contact where id=:con.id];
        
        system.assertNotEquals(firstHouseholdId,createdContacts[0].Household__c);
        system.assertEquals(street,createdContacts[0].Household__r.MailingStreet__c);
        system.assertEquals(city,createdContacts[0].Household__r.MailingCity__c);
        system.assertEquals(state,createdContacts[0].Household__r.MailingState__c);
        system.assertEquals(zip,createdContacts[0].Household__r.MailingPostalCode__c);
        system.assertEquals(country,createdContacts[0].Household__r.MailingCountry__c);
        system.assertEquals(Constants.CONTACT_LASTNAME_FOR_TESTS + ' Household',createdContacts[0].Household__r.Name);
    }
    
    static testMethod void newNoHouseholdProcessor() {
        
        Contacts_and_Orgs_Settings__c contactSettingsForTests = Constants.getContactsSettingsForTests(new Contacts_and_Orgs_Settings__c (Account_Processor__c = Constants.ONE_TO_ONE_PROCESSOR));
      
        Households_Settings__c householdSettingsForTests = Households.getHouseholdsSettingsForTests(new Households_Settings__c (Household_Rules__c = Households.NO_HOUSEHOLDS_PROCESSOR));
        String street = '2345 Elm St.';
        String city = 'Seattle';
        String state = 'WA';
        String zip = '88777';
        String country = 'US';

        Contact con = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS,
            MailingStreet = street,
            MailingCity = city,
            MailingState = state,
            MailingPostalCode = zip,
            MailingCountry = country
        );
        insert con;
        Contact[] createdContacts = [select Household__r.Name,Household__r.MailingStreet__c,Household__r.MailingCity__c,Household__r.MailingState__c,Household__r.MailingPostalCode__c,Household__r.MailingCountry__c,Household__c from Contact where id=:con.id];
        
        
        system.assertEquals(null,createdContacts[0].Household__c);
    }
    
    /// <name> newOrgContactAllContactsProcessor </name>
    /// <summary> test insert org contact with all contacts processor </summary>
    static testMethod void newOrgContactAllContactsProcessor() {
        
        Contacts_and_Orgs_Settings__c contactSettingsForTests = Constants.getContactsSettingsForTests(new Contacts_and_Orgs_Settings__c (Account_Processor__c = Constants.ONE_TO_ONE_PROCESSOR));
        
        Households_Settings__c householdSettingsForTests = Households.getHouseholdsSettingsForTests(new Households_Settings__c (Household_Rules__c = Households.ALL_PROCESSOR));
        
        Account acct = new Account(
            Name = 'Test Organization 888'
        );
        insert acct;
        
        String street = '2345 Elm St.';
        String city = 'Seattle';
        String state = 'WA';
        String zip = '88777';
        String country = 'US';
        Contact con = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS,
            MailingStreet = street,
            MailingCity = city,
            MailingState = state,
            MailingPostalCode = zip,
            MailingCountry = country,
            AccountId = acct.id
        );
        insert con;
        Contact[] createdContacts = [select Household__r.Name,Household__r.MailingStreet__c,Household__r.MailingCity__c,Household__r.MailingState__c,Household__r.MailingPostalCode__c,Household__r.MailingCountry__c,Household__c from Contact where id=:con.id];
        
        Id firstHouseholdId = createdContacts[0].Household__c;
        system.assertEquals(street,createdContacts[0].Household__r.MailingStreet__c);
        system.assertEquals(city,createdContacts[0].Household__r.MailingCity__c);
        system.assertEquals(state,createdContacts[0].Household__r.MailingState__c);
        system.assertEquals(zip,createdContacts[0].Household__r.MailingPostalCode__c);
        system.assertEquals(country,createdContacts[0].Household__r.MailingCountry__c);
        system.assertEquals(Constants.CONTACT_LASTNAME_FOR_TESTS + ' Household',createdContacts[0].Household__r.Name);
        
        //blank out the HH
        con.Household__c = null;
        update con;
        
        createdContacts = [select Household__r.Name,Household__r.MailingStreet__c,Household__r.MailingCity__c,Household__r.MailingState__c,Household__r.MailingPostalCode__c,Household__r.MailingCountry__c,Household__c from Contact where id=:con.id];
        
        system.assertNotEquals(firstHouseholdId,createdContacts[0].Household__c);
        system.assertEquals(street,createdContacts[0].Household__r.MailingStreet__c);
        system.assertEquals(city,createdContacts[0].Household__r.MailingCity__c);
        system.assertEquals(state,createdContacts[0].Household__r.MailingState__c);
        system.assertEquals(zip,createdContacts[0].Household__r.MailingPostalCode__c);
        system.assertEquals(country,createdContacts[0].Household__r.MailingCountry__c);
        system.assertEquals(Constants.CONTACT_LASTNAME_FOR_TESTS + ' Household',createdContacts[0].Household__r.Name);
    }

    /// <name> newOrgContactIndividualsProcessor </name>
    /// <summary> test insert org contact with Individuals processor </summary>
    static testMethod void newOrgContactIndividualsProcessor() {
        
        Contacts_and_Orgs_Settings__c contactSettingsForTests = Constants.getContactsSettingsForTests(new Contacts_and_Orgs_Settings__c (Account_Processor__c = Constants.ONE_TO_ONE_PROCESSOR));
        
        Households_Settings__c householdSettingsForTests = Households.getHouseholdsSettingsForTests(new Households_Settings__c (Household_Rules__c = Households.ALL_INDIVIDUALS_PROCESSOR));
        
        Account acct = new Account(
            Name = 'Test Organization 888'
        );
        insert acct;
        
        String street = '2345 Elm St.';
        String city = 'Seattle';
        String state = 'WA';
        String zip = '88777';
        String country = 'US';
        Contact con = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS,
            MailingStreet = street,
            MailingCity = city,
            MailingState = state,
            MailingPostalCode = zip,
            MailingCountry = country,
            AccountId = acct.id
        );
        insert con;
        Contact[] createdContacts = [select Household__c from Contact where id=:con.id];
        
        system.assertEquals(null,createdContacts[0].Household__c);
        
        //blank out the HH
        con.MailingStreet = 'test';
        update con;
        
        createdContacts = [select Household__c from Contact where id=:con.id];
        
        system.assertEquals(null,createdContacts[0].Household__c);
    }

    /// <name> contactDeleteWithOwnHousehold </name>
    /// <summary> test delete a contact that has it's own household </summary>
    static testMethod void contactDeleteWithOwnHousehold() {
        
        Contacts_and_Orgs_Settings__c contactSettingsForTests = Constants.getContactsSettingsForTests(new Contacts_and_Orgs_Settings__c (Account_Processor__c = Constants.ONE_TO_ONE_PROCESSOR));
        
        Households_Settings__c householdSettingsForTests = Households.getHouseholdsSettingsForTests(new Households_Settings__c (Household_Rules__c = Households.ALL_INDIVIDUALS_PROCESSOR));
        
        String lastname = 'SmithForTest99';
        Contact con = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS
        );
        insert con;
        Contact[] createdContacts = [select Household__c from Contact where id=:con.id];
        
        Id firstHouseholdId = createdContacts[0].Household__c;
        
        delete con;
        
        Household__c[] deletedHousehold = [select id from Household__c where id=:firstHouseholdId];
        system.assert(deletedHousehold.size()==0);
    }
    
    /// <name> contactDeleteWithSharedHousehold </name>
    /// <summary> test delete a contact that has shared household </summary>
    static testMethod void contactDeleteWithSharedHousehold() {
        
        Contacts_and_Orgs_Settings__c contactSettingsForTests = Constants.getContactsSettingsForTests(new Contacts_and_Orgs_Settings__c (Account_Processor__c = Constants.ONE_TO_ONE_PROCESSOR));
        
        Households_Settings__c householdSettingsForTests = Households.getHouseholdsSettingsForTests(new Households_Settings__c (Household_Rules__c = Households.ALL_INDIVIDUALS_PROCESSOR));
        
        String lastname = 'SmithForTest99';
        Contact con = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS
        );
        insert con;
        Contact[] createdContacts = [select Household__c from Contact where id=:con.id];
        
        Id firstHouseholdId = createdContacts[0].Household__c;
        
        Contact con2 = new Contact(
            FirstName='test again',
            LastName=lastname,
            Household__c = firstHouseholdId
        );
        insert con2;
        
        delete con;
        
        Household__c[] remainingHousehold = [select id from Household__c where id=:firstHouseholdId];
        system.assert(remainingHousehold.size()==1);
    }

    /// <name> getHouseholdTransactionTotal </name>
    /// <summary>  </summary>
    static testMethod void getHouseholdTransactionTotal_test()
    {
        Household__c h = new Household__c(Name='Test Household');
        insert h;
        Contact c = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS,
            Household__c=h.Id
        );
        insert c;
        Opportunity o = new Opportunity(Name='test oppty',CloseDate=System.Today(),StageName=UnitTestData.getClosedWonStage(),Amount=100);
        insert o;
        OpportunityContactRole ocr = new OpportunityContactRole(OpportunityId=o.Id,ContactId=c.Id,Role='Test');
        insert ocr;
        system.assertEquals(system.label.DefaultHouseholdTransactionCurrency + '100.00',Households.getHouseholdTransactionTotal(h.id));
    }
    
    /// <name> getHouseholdTransactionTotal </name>
    /// <summary>  </summary>
    static testMethod void getHouseholdLastTransaction_test()
    {
        Integer year = 2005;
        Integer month = 10;
        Integer day = 10;
        Household__c h = new Household__c(Name='Test Household');
        insert h;
        Contact c = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS,
            Household__c=h.Id
        );
        insert c;
        Opportunity o = new Opportunity(Name='test oppty',CloseDate=date.newInstance(year,month,day),StageName=UnitTestData.getClosedWonStage(),Amount=100);
        insert o;
        OpportunityContactRole ocr = new OpportunityContactRole(OpportunityId=o.Id,ContactId=c.Id,Role='Test');
        insert ocr;
        system.assertEquals(String.valueOf(year)+'-'+String.valueOf(month)+'-'+String.valueOf(day),Households.getHouseholdLastTransaction(h.id));
    }
    
     /// visualforce and apex methods for totals
    static testMethod void getHouseholdTransactionAmount_test()
    {
        
        Household__c h = new Household__c(Name='Test Household');
        insert h;
        Contact c = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS,
            Household__c=h.Id
        );
        insert c;
        Opportunity o = new Opportunity(Name='test oppty',CloseDate=date.newInstance(2007,3,3),StageName=UnitTestData.getClosedWonStage(),Amount=100);
        insert o;
        OpportunityContactRole ocr = new OpportunityContactRole(OpportunityId=o.Id,ContactId=c.Id,Role='Test');
        insert ocr;
        
        //pass contact into the controller
        ApexPages.StandardController sc = new ApexPages.standardController(h);
        //pass the controller into the extension
        HouseholdTransactionHistory_EXT ext = new HouseholdTransactionHistory_EXT(sc);  
        
        system.assertEquals(system.Label.DefaultHouseholdTransactionCurrency + '100.00',ext.getHouseholdTransactionTotal());
    }
    
    /// visualforce and apex methods for totals
    static testMethod void getHouseholdLastTransactionDate_test()
    {
        Integer year = 2005;
        Integer month = 10;
        Integer day = 10;
        
        Household__c h = new Household__c(Name='Test Household');
        insert h;
        Contact c = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS,
            Household__c=h.Id
        );
        insert c;
        Opportunity o = new Opportunity(Name='test oppty',CloseDate=date.newInstance(year,month,day),StageName=UnitTestData.getClosedWonStage(),Amount=100);
        insert o;
        OpportunityContactRole ocr = new OpportunityContactRole(OpportunityId=o.Id,ContactId=c.Id,Role='Test');
        insert ocr;
        
        //pass contact into the controller
        ApexPages.StandardController sc = new ApexPages.standardController(h);
        //pass the controller into the extension
        HouseholdTransactionHistory_EXT ext = new HouseholdTransactionHistory_EXT(sc);
        
        system.assertEquals(String.valueOf(day) + '/' + String.valueOf(month) + '/' + String.valueOf(year),ext.getLastTransactionDate());
    }
    
    static testMethod void deleteEmptyHouseholds_test(){
        
        Households_Settings__c householdSettingsForTests = Households.getHouseholdsSettingsForTests(new Households_Settings__c (Household_Rules__c = Households.ALL_PROCESSOR, Advanced_Household_Naming__c = true));
        Contacts_and_Orgs_Settings__c contactSettingsForTests = Constants.getContactsSettingsForTests(new Contacts_and_Orgs_Settings__c (Account_Processor__c = Constants.ONE_TO_ONE_PROCESSOR));
         
        Contact c1 = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName=Constants.CONTACT_LASTNAME_FOR_TESTS,
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS            
        );
            
    	insert c1;    	
    	Contact c1t = [select id, Household__c from Contact where id = :c1.id];
    	system.assert(c1t.Household__c != null);
    	Contact c2 = new Contact(
            FirstName=Constants.CONTACT_FIRSTNAME_FOR_TESTS,
            LastName='c2test',
            WorkEmail__c = Constants.CONTACT_EMAIL_FOR_TESTS, 
            Preferred_Email__c = Constants.CONTACT_PREFERRED_EMAIL_FOR_TESTS,
            WorkPhone__c = Constants.CONTACT_PHONE_FOR_TESTS,
            PreferredPhone__c = Constants.CONTACT_PREFERRED_PHONE_FOR_TESTS            
        );
            
        insert c2;       
        Contact c2t = [select id, Household__c from Contact where id = :c2.id];
        system.assert(c2t.Household__c != null);
        
        //move the c2 contact into c1's household
        id c2thhid = c2t.Household__c;
        c2t.Household__c = c1t.Household__c;
        update c2t;
        
        //get c1s household
        Household__c hh1 = [select Name from Household__c where id = :c1t.Household__c];
        //assert the naming worked as c2t was moved into the c1 households
        system.assert(hh1.Name.contains('c2test')); 
    	
    	//the second household should be deleted
    	system.assertEquals(0, [select count() from Household__c where id = :c2thhid]);
    	
    }
    
    
}