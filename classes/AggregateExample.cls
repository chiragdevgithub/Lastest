/**
 *To show Aggregate Functions..
 *
 * Revision History
 *	Version			Author			Date(dd/mm/yyyy)		Comments
 *		1.0			Chirag			11/01/17				Initial version
 */
public with sharing class AggregateExample {
	/**
	* Current Fiscal Year Records. 
	**/
	public void getAggregate(){
		Integer key;
		Double value;
		map<Integer,Double> mapping=new map<Integer,Double>();
		List<AggregateResult> groupedResults=[select sum(amount) total,FiscalYear from Opportunity  where isClosed=true group by FiscalYear ];
		for(AggregateResult result:groupedResults){
			key=(Integer)result.get('FiscalYear');
			value=(Double)result.get('total');
			if(!mapping.containsKey(key)){
				mapping.put(key,value);
			}
		}
		
		for(Integer mappings:mapping.keySet()){
			system.debug(mappings+' '+mapping.get(mappings));
		}
		
	}
	/**
	* Counting Distinct Lead Source.
	**/
	public void getDistinct(){
		Integer i=0;
		AggregateResult[] record=[select company,COUNT_DISTINCT(LEADSOURCE) from LEAD group by company having count(LEADSOURCE)>10];
		for(AggregateResult accounts:record){
			system.debug(''+i+' '+accounts);
			i++;	
		}
	}
	/**
	* Use of Map in Map.
	**/
	public void getLeads() {
		String key,keys;
	    Integer value,values;
	    map<String,Integer> mapping=new  map<String,Integer>();
	    map<String,map<String,Integer>> maps=new map<String,map<String,Integer>>();
     	AggregateResult[] record=  [SELECT count(Id) total,status,LeadSource from Lead group by Status,LeadSource];
        for(AggregateResult result:record){
            key=(String)result.get('Status');
            value=(Integer)result.get('total');
            if(!mapping.containsKey(key)){
                mapping.put(key,value);
            }    
            keys=(String)result.get('LeadSource');
            if(!maps.containsKey(key)){
                maps.put(keys,mapping);
            }
        }   
       system.debug(maps);
    }
}