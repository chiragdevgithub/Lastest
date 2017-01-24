/**
 *AllDemo class is to show demonstration of all context vairables.
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			13/01/17					Initial version
 */

public with sharing class AllDemo {
	
	/**
	 * Demo of trigger Context on occuerence of all events.
	*/
	 
	private void triggerContexts(){
    	system.debug(Trigger.new);
    	system.debug(Trigger.old);
    	system.debug(Trigger.NewMap);
    	system.debug(Trigger.OldMap);
	}
	
	public void triggerContext(){
		triggerContexts();
	}
	
}