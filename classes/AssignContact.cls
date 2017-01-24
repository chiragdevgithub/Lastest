/**
 * Pallindrome class is to check whether a particular String is pallindrome or not by using isPalindrome method.
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			11/01/17				Initial version
 */
public with sharing class AssignContact {
	/**
	 * Displays the records of Contact in list.
	 */
	public void queryContact() {
		List<Contact> contacts=[select Name from Contact];
		system.debug(contacts);	
	}
}