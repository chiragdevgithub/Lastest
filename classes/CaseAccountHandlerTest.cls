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
private class CaseAccountHandlerTest {
	 
	 /* Test cases
	 * 1.If origin is set to phone then do not associate it with contactId.
	 * 2.If there is no associating contact for case record then check in 
	 *	account's email Field. 
	 * 3.If the email id is in account and contact both then what?
	 */
	 
    static testMethod void insertOriginPhone() {
        test.startTest();
        Case caseRecord=new Case(origin='Phone',Email_Address__c='nikhil@google.com');
        insert caseRecord;
       	test.stopTest();
        
        Case c = [select ContactId from Case where id =: caseRecord.id ];
        system.assertEquals(null,c.ContactId);

    }
    
    static testMethod void populateToAccount() {
        test.startTest();
        Case caseRecord=new Case(origin='Web',Email_Address__c='chirag@no.com');
        insert caseRecord;
        
        Account account=new Account(Name='noName',Email__c='chirag@no.com');
       	test.stopTest();
        
        Case c = [select AccountId,ContactId from Case where id =: caseRecord.id ];
        system.assertEquals(null,c.ContactId);
        system.assertEquals(account.id,c.AccountId);

    }
    
    static testMethod void checkPopulationTo() {
        test.startTest();
        Case caseRecord=new Case(origin='Web',Email_Address__c='chirag@notit.com');
        insert caseRecord;
        
        Contact contactsRecord=new Contact(LastName='ct1',email='chirag@notit.com',name__c='test',score__c=55);
        insert contactsRecord;
        
        Account account=new Account(Name='noName',Email__c='chirag@notit.com');
        insert account;
       	test.stopTest();
        
        Case c = [select AccountId,ContactId from Case where id =: caseRecord.id ];
        system.assertEquals(contactsRecord.name,c.ContactId);
        system.assertEquals(null,c.AccountId);

    }
    
    
    
}