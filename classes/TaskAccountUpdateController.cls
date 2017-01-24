/**
 * TaskAccountUpdateController is the handler class of TaskAccountUpdate Trigger.
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			13/01/17				Initial version
 */

public with sharing class TaskAccountUpdateController {
	
	/**
	 * Create task on creation of Account Record.
	 */
	 
	private void updateTasks(List<Account> accounts) {
		List<Task> tasks = new List<Task>();
		Task t;
 		try{
       	 	for(Account a : accounts) {
            	t = new Task();
            	t.subject='Meeting with '+a.Name;
            	t.whatId=a.Id;
            	tasks.add(t);
        	}
        insert tasks;
 		}catch(DMLException exceptions){
 			system.debug('DML exception has occured');
 		}
	} 
	
	public void afterInsertAccount(List<Account> accounts) {
		updateTasks(accounts);
	}	
		
}