/**************************************************************************************************
 * Trigger : SampleAccount
 * Description : Trigger to demonstrate new,old,NewMap,OldMap.
 
 * Version History:
 * Version  Developer Name    Date          Detail Features
 * 1.0      Chirag   12/1/17   Initial Development
 **************************************************************************************************/


trigger SampleAccount on Account (before update) {
	AccountTrigger account=new AccountTrigger();
	account.demoTrigger();
}