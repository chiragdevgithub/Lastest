/**
 *To show the demo of Map Collection and to show all account records selected in particular year.
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			11/01/17				Initial version
 */
public with sharing class AssignMap {
	/**
	 * Map having account name as key and accountID as value.
	**/
	public void evaluate(){
		map<String,Id> mapping=new map<String,Id>();
		for (Account accounts :[select Id, Name from Account ] ){
			mapping.put(accounts.Name,accounts.Id);
		}
		system.debug(mapping);
	}
	/**
	 * Map having accountId as key and accounts as value.
	**/
	public void evaluateObject(){
		map<Id,Account> mapping=new map<Id,Account>();
		for (Account accounts :[select Id, Name,BillingAddress from Account ] ){
			mapping.put(accounts.Id,accounts);
		}
		system.debug(mapping);
	}
	/**
	 * Displaying all records of enrollment year 2010,2013,2014.
	**/
	public void showAccounts(){
		List<Account> accounts=[select Id, Name,BillingAddress from Account where Enrollment_Year__c='2010'];
		List<Account> newAccounts=[select Id, Name,BillingAddress from Account where Enrollment_Year__c includes
		('2013','2014')];
		system.debug(accounts);
		system.debug(newAccounts);
	}
}