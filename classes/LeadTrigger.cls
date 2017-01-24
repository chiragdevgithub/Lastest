public with sharing class LeadTrigger {
	public void evaluate(){
	List<Task> tasks = new List<Task>();
        Task t;
        
        
        for(Account a : trigger.New) {
            t = new Task();
            t.subject='Meeting with '+a.Name;
            t.whatId=a.Id;
            tasks.add(t);
        }
        insert tasks;
    }
}
