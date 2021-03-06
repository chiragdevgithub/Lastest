/**
 * Demonstration of database.query(String).
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			11/01/17					Initial version
 */
public with sharing class DatabaseExample {
	/*
	*Demonstration of Database class.
	*/
	public void demoDatabase(String paramName) {
		List<Account> accounts = Database.query('select Id from Account where name=: paramName ');
		Account[] insertAccounts = new List<Account>{ new Account(Name='Account3')};
		Database.insert(insertAccounts);
		for (Account obj:accounts) {	
				System.debug(obj);//Printing the Record fetched	
		}
	}
	public void demoSearch(){
		String searchquery='FIND \'Edge*\' IN ALL FIELDS RETURNING Account(id,name),Contact, Lead';
		List<List<SObject>>searchList=search.query(searchquery);
		system.debug(searchList);
	}
}