/**
 *Trigger Name:- TaskAccountUpdate
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			12/01/17					Initial version
 */

trigger AccountTrigger on Account (after insert) {
    if(Trigger.isAfter && Trigger.isInsert ) {
       TaskAccountUpdateController taskAccountUpdate=new TaskAccountUpdateController();
       taskAccountUpdate.afterInsertAccount(Trigger.new);
    }
}