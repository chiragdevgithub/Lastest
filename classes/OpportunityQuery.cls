/**
  *To get Unique values Unique Class is used.
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			10/01/17				Initial Draft
 */
public  class OpportunityQuery {
	/*
	*To Show Opportunity Id where Stage is closed and there is some account with it.
	*@param parameter name type desc
	*@param numbers Integer[] input numbers
	*@return Set<Integer> Unique numbers	
	*/	
	public void evaluateList(){
		List<Id> list1 = new List<Id>();
		List<Opportunity> example1=[select Id from Opportunity where Account.Id!=null and StageName='Closed Won' ];
		
		for(Opportunity op:example1){
			list1.add(op.Id);
		}
		System.debug(list1.size());
		for (Opportunity obj: example1) {	
			System.debug(obj.Id);//Printing the Record fetched
		}
	}
	
	/*
	*To Show Account Id where Stage is closed and there is some account with it.
	*@param parameter name type desc
	*@param numbers Integer[] input numbers
	*@return Set<Integer> Unique numbers	
	*/	
	
	public void evaluateSet(){
		
		List<Opportunity> example2=[select Account.Id from Opportunity where AccountId !=null and StageName='Closed Won' ];
		Set<Opportunity> uniqKeys = new Set<Opportunity>();
		uniqKeys.addAll(example2);
		for (Opportunity s: uniqkeys) {	
			System.debug(s.Account.Id);//Printing the Record fetched
		}
		
	}
	
	/*
	*To Show Account Id where Stage is closed and there is some account with it and
	*map them in key value pair.
	*/
	
	public void evaluateMap(){
		map<String,String> m = new map<String,String>();
		for (Opportunity opp :[select Id,AccountId from Opportunity where Account.Id!=null and StageName='Closed Won' ] ){
			m.put(opp.Id,opp.AccountId);
		}
		system.debug(m);	
	}				
}