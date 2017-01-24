/**
 * LeadCloneHandler is a class which has defination for LeadTrigger.
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			11/01/17				Initial version
 */

public with sharing class LeadCloneHandler {
	
	/**
	 * Create a clone of lead record.
	 */
	 
	private void cloneLead(List<Lead> leads) {
		if(RecursionControl.runOnce()) {
			List<Lead> clone = new List<Lead>();
 			for (Lead lead : leads) {
       		 clone.add(new Lead(LastName=lead.LastName,Company=lead.Company,Status=lead.Status));
   			}
    	insert  clone;
		}		
	}
	
	public void afterInsertLead(List<Lead> leads){
		cloneLead(leads);
	}
	
}