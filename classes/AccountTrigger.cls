/**
 * Account Trigger is the handler class of Account Trigger.
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			13/01/17				Initial version
 */

public with sharing class AccountTrigger {
	
	/**
	 * Demonstration of Context Variables.
	 */
	
	private void demonstrationTrigger(){
		List<Account> newTriggers = Trigger.new;
		system.debug(newTriggers);
		map<Id,SObject> newTriggerMap = Trigger.NewMap;
		system.debug(newTriggerMap);
		List<Account> oldTriggers = Trigger.old;
		system.debug(oldTriggers);
		map<Id,SObject> oldTriggerMap = Trigger.OldMap;
		system.debug(oldTriggerMap);
	}
	
	public void demoTrigger(){
		demonstrationTrigger();
	}

}