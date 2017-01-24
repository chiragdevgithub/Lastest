/**
 *To demonstrate Relationship and to traverse from parent to child.
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			11/01/17				Initial version
 */

public with sharing class ParentToChildDemo {
	
	/**
	* Display records with name John
	**/
	
	public void getRecordsJohn(){
		List<Account> accounts=[select Name, (select Name
		from Contacts where Contact.FirstName='John') from Account  ];
		system.debug(accounts);
	}
	
	/**
	* Display all records which has opportunity record as closed Won.
	**/ 
	
	public void evaluateOpportunity(){
	List<Account> accounts=[select Name ,(select Name
		from Opportunities where StageName='Closed Won') from Account  ];
		system.debug(accounts);
	}
	
	/**
	* Display all records which has child name as john.
	**/ 
	
	public void evaluateA(){
		List<A__c> records=[select Id, Name, (Select Id, Name from Children__r where Name='john') from A__c];
		system.debug(records);
	}
	
}