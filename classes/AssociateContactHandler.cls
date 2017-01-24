/**************************************************************************************************
 * AssociateContactHandler
 * Description : To associate Contacts to Account on basis of emailid and domain.
 
 * Version History:
 * Version  Developer Name    Date          Detail Features
 * 1.0      Chirag   17/1/17   Initial Development
 **************************************************************************************************/

public with sharing class AssociateContactHandler {
	
	/**
	 * Associate contact to Account lookup.
	 */
	 
	private void mapContactToAccount(List<Contact> contacts) {
		String domainName;
			List<Contact> allContacts=isFilteredContacts(contacts);
		try{
			map<String,List<Contact>> mapContact=new map<String,List<Contact>>();
			for(Contact c : allContacts){
				//if(String.isNotBlank(c.Email))
					 domainName = c.Email.split('@').get(1);
				if(mapContact.containsKey(domainName)){
					List<Contact> contactRecords =mapContact.get(domainName);
					contactRecords.add(c);
					mapContact.put(domainName, contactRecords);
				}
				else {
		  			 mapContact.put(domainName, new List<Contact> {c});
	   	 		}
			}
		
			for(Account a : [select Id, Site from Account where site in :mapContact.keySet()]) {
				for(Contact c:mapContact.get(a.site)) {
					if(String.isNotBlank(c.Email))
					c.AccountId = a.Id;
				}
			}
		
		}catch(DMLException e){
		system.debug('DML Exception has occured');
		}
	}
	
	public void beforeInsertContacts(List<Contact> contacts) {
		mapContactToAccount(contacts);
	}
	
	
	private List<Contact> isFilteredContacts(List<Contact> contactRecords){
		List<Contact> contacts=new List<Contact>();
		for(Contact c : contacts) {
				if(String.isNotBlank(c.Email)) {
					contacts.add(c);
				}			
		}
		return contacts;
	}	
	
}