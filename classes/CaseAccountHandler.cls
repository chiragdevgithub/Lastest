/**************************************************************************************************
 * CaseAccountHandler
 * Description : To associate Contacts to Case on basis of emailid.
 * Version History:
 * Version  Developer Name    Date          Detail Features
 * 1.0      Chirag   17/1/17   Initial Development
 **************************************************************************************************/

public with sharing class CaseAccountHandler {
	
	/**
	 * When a case is created account and contacts fields are populated.
	 */
	 
	private void mapContact(List<Case> cases) {  
		List<String> cn=new List<String>(); 
		Set<String> caseEmail = new Set<String>();
    	Map<String, String> contactEmailIdMap = new Map<String, String>();
    	Map<String, String> accountEmailIdMap = new Map<String, String>();
		try{
			for(Case caseRecord :cases) {	
				if(caseRecord.origin!='phone'){	
       				caseEmail.add(caseRecord.Email_Address__c);
				}
    		}

    		for(Contact c : [select Id, Email, Name from contact where Email in : caseEmail  ]){
        		contactEmailIdMap.put(c.Email,c.Id);   			
    		}	
    		  		
		
   			for(Case caseRecord :cases) {
       			 caseRecord.ContactId = contactEmailIdMap.get(caseRecord.Email_Address__c);
    				if(caseRecord.contactId==null){
    					cn.add(caseRecord.Email_Address__c);
    				}
    		}
    		
    		
    		for(Account acc : [select Id, Email__c, Name from Account where Email__c in : cn  ]) {
        		accountEmailIdMap.put(acc.Email__c,acc.Id);   			
    		}	
    		
    		for(Case caseRecord :cases) {
       			 caseRecord.AccountId = accountEmailIdMap.get(caseRecord.Email_Address__c);
    		}
    		
    		
		}catch(DMLException exceptions) {
			system.debug('DML exception has occured');
		}
	}
	
	public void beforeInsertMapContact(List<Case> cases) {
		mapContact(cases);
	}
	
}