/* Description : Trigger to create clone of lead on insert.
 --------------------------------------------------------------------------------------------------
 * Version History:
 * Version  Developer Name    Date          Detail Features
 * 1.0      Chirag    12/01/2017    Initial Development
 **************************************************************************************************/

trigger LeadTrigger on Lead (after insert, after update) {
	LeadCloneHandler clone=new LeadCloneHandler();
	clone.afterInsertLead(trigger.new);	
}