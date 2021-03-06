/**
 *To show the demo of Map Collection and to show all account records selected in particular year.
 *To show 100 opportunity records with amount greater than 10000 and starting from 51st record.
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			11/01/17				Initial version
 */
public with sharing class AssignBillingState {
	/**
	 * Display records where Billing State not kerala,
	 * maharashtra.
	**/
	public void evaluate(){
		List<Account> accounts=[select Id, Name,BillingAddress from Account where BillingState NOT IN ('Maharashtra','Kerala')
		order by BillingState desc NULLS LAST limit 10000];
		system.debug(accounts);
	}
	/**
	 * Display opportunity records where amount is greater than 10k
	 * and sorted on created date with limiy as 100 records & offset 
	 * is 50.
	**/
	public void evaluateOpportunity(){
		List<Opportunity> opportunities=[select Id, Name from Opportunity where 
		Amount>10000 order by CreatedDate asc limit 100 offset 50 all rows];
		system.debug(opportunities);
	}	
}