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
private class LeadCloneTest {
	
	/* Test cases
	 * 1. Insert single Lead record, one more record should be created
	 * 2. Insert bulk records, the count of records should be twice that of bulk count
	 */
	
    static testMethod void testSingleLeadClone() {   
    	
        Test.startTest();
        Lead leadRow=new Lead(LastName='Testing',Company='TestCompany');
        insert leadRow;
        Test.stopTest();
       	Lead leadRecords=[select name, LastName, Company from lead where id !=: leadRow.id];
        system.assertEquals('Testing',leadRecords.LastName);
        system.assertEquals('TestCompany',leadRecords.Company);
        // Asserts
        // 1. LastName should be same as leadRow
        // 2. Comapany should be same as leadRow
        
    }
    
    
    static testMethod void testBulkLeadClone() {   
    	Test.startTest();
        List<Lead> companyLeads = new list<Lead>();
		for (Integer i = 1; i <= 100; i++){
   			 Lead a = new Lead(LastName='Leada '+i,Company='Consulting Co '+i);
   			 companyLeads.add(a);
		}
		insert companyLeads;
		Test.stopTest();
			
		List<Lead>  leads = [SELECT Id FROM Lead ];	
		System.assertEquals(companyLeads.size(),100);
        System.assertEquals(leads.size(),200);
        
    }
    
    
    
}