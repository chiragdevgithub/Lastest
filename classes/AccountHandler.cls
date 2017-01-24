public class AccountHandler 
{
    /**
     *   Enum representing each of before/after CRUD events on Sobjects
     */
    public static void manage()
    {
      List<Account> newTriggers = Trigger.new;
        system.debug(newTriggers);
       map<Id,Sobject> newTriggerMap = Trigger.NewMap;
        system.debug(newTriggerMap);
        List<Account> oldTriggers = Trigger.old;
        system.debug(oldTriggers);
        map<Id,SObject> oldTriggerMap = Trigger.OldMap;
        system.debug(oldTriggerMap);
      
    }
}