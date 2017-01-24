/**
 * Trigger Name:- ContactTrigger
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			17/01/17				Initial version
 */
trigger ContactTrigger on Contact (before insert) {
	AssociateContactHandler acc=new AssociateContactHandler();
	acc.beforeInsertContacts(Trigger.new);        
}