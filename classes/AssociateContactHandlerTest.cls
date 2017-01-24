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
private class AssociateContactHandlerTest {
	 /* Test cases
	 * 1. If the email id in contact doesnt match domain in Account then association should
	 * 	  not happen. 
	 * 2. If there is no email specified in contact then what?
	 */
    static testMethod void emailCheck() {
        // TO DO: implement unit test
        test.startTest();
        Contact contact=new Contact(LastName='chiragtests',name__c='test',score__c=55,Email='chirag@nothing.com');
        insert contact;
        test.stopTest();
        Contact contacts=[select AccountId from Contact where Email='chirag@nothing.com'];
     	system.assertNotEquals('nothing.com',contacts.AccountId);   
    }
    
    static testMethod void emailEmpty() {
        // TO DO: implement unit test
        test.startTest();
        Contact contact=new Contact(LastName='chiragtests',name__c='test',score__c=85);
        insert contact;
        test.stopTest();
        Contact contacts=[select AccountId from Contact where LastName='chiragtests'];
     	system.assertEquals(null,contacts.AccountId);   
    }
    
}