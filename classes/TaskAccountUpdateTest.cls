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
private class TaskAccountUpdateTest {
	
	/* Test cases
	 * 1. Insert single Account record, one task should be created.
	 * 2. Insert bulk records, the count of records should be same as that of bulk count.
	 */

    static testMethod void insertSingleRecord() {
        // TO DO: implement unit test
        test.startTest();
        Account account=new Account(name='chiragtests');
        insert account;
        test.stopTest();
        Task task=[select Subject from Task where AccountId =:account.Id];
     	system.assertEquals('Meeting with chiragtests',task.Subject);   
             
    }
    
    static testMethod void insertBulkRecord() {
        // TO DO: implement unit test
        Test.startTest();
        List<Account> accounts = new list<Account>();
		for (Integer i = 1; i <= 100; i++){
   			 Account a = new Account(name='chiragtest'+i);
   			 accounts.add(a);
		}
		insert accounts;		
		Test.stopTest();
		
		 Task[] task=[select Subject from Task ];
		 
		system.assertEquals(task.size(),accounts.size());
             
    }
    
    
}