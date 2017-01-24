/**
 *Trigger Name:- AllAccounts
 *Demonstration of all events.
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			12/01/17					Initial version
 */


trigger AllAccounts on Account (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) {
    AllDemo demo=new AllDemo();
	if (Trigger.isInsert) {
        if (Trigger.isBefore) {
           demo.triggerContext();
        } else if (Trigger.isAfter) {
            demo.triggerContext();
        }        
    }
    else if (Trigger.isDelete) {
       if (Trigger.isBefore) {
             demo.triggerContext();
        } else if (Trigger.isAfter) {
            demo.triggerContext();
        } 
    }
	else if (Trigger.isUpdate) {
       if (Trigger.isBefore) {
            demo.triggerContext();
        } else if (Trigger.isAfter) {
             demo.triggerContext();
        } 
    }
}