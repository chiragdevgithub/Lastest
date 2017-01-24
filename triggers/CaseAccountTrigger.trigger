/*
 * Trigger Name:- CaseAccountTrigger
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			17/01/17				Initial version
 */

trigger CaseAccountTrigger on Case (before insert) {
    if(Trigger.isBefore && Trigger.isInsert) {
        CaseAccountHandler caseAccount=new CaseAccountHandler();
		caseAccount.beforeInsertMapContact(Trigger.new);	
	}
}